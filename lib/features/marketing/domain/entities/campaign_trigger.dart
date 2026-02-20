enum CampaignTriggerType {
  inactive30Days,
  bigSpender,
  birthday,
  manual,
}

enum CampaignChannel {
  sms,
  email,
}

extension CampaignTriggerLabel on CampaignTriggerType {
  String get label {
    switch (this) {
      case CampaignTriggerType.inactive30Days:
        return 'We Miss You (Inactive 30+ Days)';
      case CampaignTriggerType.bigSpender:
        return 'Big Spender (VIP)';
      case CampaignTriggerType.birthday:
        return 'Birthday Greeting';
      case CampaignTriggerType.manual:
        return 'Manual Blast';
    }
  }
}
