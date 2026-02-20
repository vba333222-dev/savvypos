import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/entities/zone.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/floor_plan_editor_bloc.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/table_edit_dialog.dart';
import 'package:uuid/uuid.dart';

class FloorPlanEditorPage extends StatelessWidget {
  const FloorPlanEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FloorPlanEditorBloc>()..add(const FloorPlanEditorEvent.started()),
      child: const _FloorPlanEditorView(),
    );
  }
}

class _FloorPlanEditorView extends StatelessWidget {
  const _FloorPlanEditorView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Plan Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add a new table to the current zone
              final bloc = context.read<FloorPlanEditorBloc>();
              final state = bloc.state;
              if (state.selectedZoneId == null && state.zones.isNotEmpty) {
                 bloc.add(FloorPlanEditorEvent.zoneSelected(state.zones.first.id));
              }
              
              // Default new table
              final newTable = SavvyTable(
                id: const Uuid().v4(),
                name: 'New Table',
                zoneId: state.selectedZoneId,
                x: 100,
                y: 100,
              );
              bloc.add(FloorPlanEditorEvent.tableSaved(newTable));
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_location_alt),
            onPressed: () async {
               // Show Add Zone Dialog
               // Simplified for now
               final bloc = context.read<FloorPlanEditorBloc>();
               final newZone = Zone(
                 id: const Uuid().v4(),
                 name: 'New Zone ${bloc.state.zones.length + 1}',
               );
               bloc.add(FloorPlanEditorEvent.zoneSaved(newZone));
               bloc.add(FloorPlanEditorEvent.zoneSelected(newZone.id));
            },
          )
        ],
      ),
      body: BlocBuilder<FloorPlanEditorBloc, FloorPlanEditorState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state.zones.isEmpty) {
             return const Center(child: Text('Create a Zone to start'));
          }
          
          final selectedZoneId = state.selectedZoneId ?? state.zones.first.id;
          final currentZoneTables = state.tables.where((t) => t.zoneId == selectedZoneId).toList();
          
          return Column(
            children: [
              // Zone Selector Bar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.zones.map((zone) {
                    final isSelected = zone.id == selectedZoneId;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(zone.name),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            context.read<FloorPlanEditorBloc>().add(FloorPlanEditorEvent.zoneSelected(zone.id));
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // Editor Canvas
              Expanded(
                child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.1,
                  maxScale: 2.0,
                  child: Container(
                    width: 2000, // Fixed large canvas
                    height: 2000,
                    color: Colors.grey[200], // Background
                    child: Stack(
                      children: currentZoneTables.map((table) {
                        return Positioned(
                          left: table.x,
                          top: table.y,
                          child: GestureDetector(
                            onPanUpdate: (details) {
                              // Logic handled by child widget for performance
                            },
                            onPanEnd: (details) {
                               
                            },
                            child: _DraggableTableWidget(table: table),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DraggableTableWidget extends StatefulWidget {
  final SavvyTable table;
  const _DraggableTableWidget({required this.table});

  @override
  State<_DraggableTableWidget> createState() => _DraggableTableWidgetState();
}

class _DraggableTableWidgetState extends State<_DraggableTableWidget> {
  late double x;
  late double y;
  
  @override
  void initState() {
    super.initState();
    x = widget.table.x;
    y = widget.table.y;
  }
  
  @override
  void didUpdateWidget(_DraggableTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.table != widget.table) {
      x = widget.table.x;
      y = widget.table.y;
    }
  }

  @override
  Widget build(BuildContext context) {
    // We override the Positioned logic by handling drag here?
    // No, Stack requires Positioned to be the direct child.
    // So this widget must be the child of Positioned which is managed by parent?
    // Parent maps state to Positioned.
    // So parent needs `onPanUpdate`.
    
    // To support drag properly without re-rendering parent on every frame:
    // We should use a `Stack` where the children are stateful and manage their own ephemeral position,
    // and only notify parent (Bloc) on drag end.
    
    return GestureDetector(
      onTap: () async {
        final updated = await showDialog<SavvyTable>(
          context: context,
          builder: (context) => TableEditDialog(table: widget.table),
        );
        if (updated == null || !mounted) return;
        // ignore: use_build_context_synchronously
        context.read<FloorPlanEditorBloc>().add(FloorPlanEditorEvent.tableSaved(updated));
      },
      onPanUpdate: (details) {
        setState(() {
          x += details.delta.dx;
          y += details.delta.dy;
        });
      },
      onPanEnd: (details) {
        context.read<FloorPlanEditorBloc>().add(
          FloorPlanEditorEvent.tableSaved(
            widget.table.copyWith(x: x, y: y)
          )
        );
      },
      child: Transform.translate(
        offset: Offset(x - widget.table.x, y - widget.table.y), 
        child: Container(
          width: widget.table.width,
          height: widget.table.height,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: widget.table.shape == TableShape.round ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(color: Colors.black),
            boxShadow: [
               BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
            ],
          ),
          alignment: Alignment.center,
          child: Text(widget.table.name),
        ),
      ),
    );
  }
}
