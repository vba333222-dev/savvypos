import 'package:flutter/material.dart';

class NetworkRequest {
  final String method;
  final String endpoint;
  final int statusCode;
  final int durationMs;
  final String? responseBody;

  NetworkRequest(this.method, this.endpoint, this.statusCode, this.durationMs, {this.responseBody});
}

class NetworkTrafficWidget extends StatelessWidget {
  const NetworkTrafficWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final requests = [
      NetworkRequest('GET', '/v1/config/sync', 200, 45, responseBody: '{"sync_interval": 300, "features": [...]}'),
      NetworkRequest('POST', '/v1/orders/batch', 201, 120, responseBody: '{"id": "ord_123", "status": "queued"}'),
      NetworkRequest('GET', '/v1/inventory/delta', 200, 89),
      NetworkRequest('POST', '/v1/telemetry', 500, 60, responseBody: '{"error": "Internal Server Error"}'),
      NetworkRequest('GET', '/v1/products', 200, 210),
    ];

    return ListView.builder(
      itemCount: requests.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final req = requests[index];
        final isError = req.statusCode >= 400;
        final color = isError ? Colors.redAccent : Colors.greenAccent;

        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
            leading: div(
              width: 12, height: 12, 
              decoration: BoxDecoration(
                color: color, 
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 6)]
              )
            ),
            title: Text(req.endpoint, style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 12)),
            subtitle: Row(
               children: [
                 Text(req.method, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 10)),
                 const SizedBox(width: 8),
                 Text('${req.statusCode}', style: TextStyle(color: color, fontSize: 10)),
                 const SizedBox(width: 8),
                 Text('${req.durationMs}ms', style: const TextStyle(color: Colors.grey, fontSize: 10)),
               ],
            ),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.black54,
                child: Text(
                  req.responseBody ?? 'No Body',
                  style: const TextStyle(color: Colors.grey, fontFamily: 'monospace', fontSize: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget div({required double width, required double height, required Decoration decoration}) {
    return Container(width: width, height: height, decoration: decoration);
  }
}
