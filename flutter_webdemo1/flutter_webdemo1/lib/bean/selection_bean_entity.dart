class SelectionBeanEntity {
	SelectionBeanData data;
	int errorcode;
	String errormsg;

	SelectionBeanEntity({this.data, this.errorcode, this.errormsg});

	SelectionBeanEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new SelectionBeanData.fromJson(json['data']) : null;
		errorcode = json['Errorcode'];
		errormsg = json['Errormsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['Errorcode'] = this.errorcode;
		data['Errormsg'] = this.errormsg;
		return data;
	}
}

class SelectionBeanData {
	List<SelectionBeanDataNewProfessor> newProfessor;
	List<SelectionBeanDataGeniu> genius;
	List<SelectionBeanDataPublicMeat> publicMeats;
	List<SelectionBeanDataGroup> groups;
	List<SelectionBeanDataEvent> events;

	SelectionBeanData({this.newProfessor, this.genius, this.publicMeats, this.groups, this.events});

	SelectionBeanData.fromJson(Map<String, dynamic> json) {
		if (json['new_professor'] != null) {
			newProfessor = new List<SelectionBeanDataNewProfessor>();(json['new_professor'] as List).forEach((v) { newProfessor.add(new SelectionBeanDataNewProfessor.fromJson(v)); });
		}
		if (json['genius'] != null) {
			genius = new List<SelectionBeanDataGeniu>();(json['genius'] as List).forEach((v) { genius.add(new SelectionBeanDataGeniu.fromJson(v)); });
		}
		if (json['public_meats'] != null) {
			publicMeats = new List<SelectionBeanDataPublicMeat>();(json['public_meats'] as List).forEach((v) { publicMeats.add(new SelectionBeanDataPublicMeat.fromJson(v)); });
		}
		if (json['groups'] != null) {
			groups = new List<SelectionBeanDataGroup>();(json['groups'] as List).forEach((v) { groups.add(new SelectionBeanDataGroup.fromJson(v)); });
		}
		if (json['events'] != null) {
			events = new List<SelectionBeanDataEvent>();(json['events'] as List).forEach((v) { events.add(new SelectionBeanDataEvent.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.newProfessor != null) {
      data['new_professor'] =  this.newProfessor.map((v) => v.toJson()).toList();
    }
		if (this.genius != null) {
      data['genius'] =  this.genius.map((v) => v.toJson()).toList();
    }
		if (this.publicMeats != null) {
      data['public_meats'] =  this.publicMeats.map((v) => v.toJson()).toList();
    }
		if (this.groups != null) {
      data['groups'] =  this.groups.map((v) => v.toJson()).toList();
    }
		if (this.events != null) {
      data['events'] =  this.events.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SelectionBeanDataNewProfessor {
	List<SelectionBeanDataNewProfessorTopic> topics;
	Object helpCount;
	Object fansCount;
	Object consultationCount;
	Object geniusName;
	Object geniusID;
	Object score;
	Object geniusDescription;
	List<String> userTags;
	Object photoUrl;
	Object isProfessor;
	Object consultationFee;
	Object consultationSwitch;

	SelectionBeanDataNewProfessor({this.topics, this.helpCount, this.fansCount, this.consultationCount, this.geniusName, this.geniusID, this.score, this.geniusDescription, this.userTags, this.photoUrl, this.isProfessor, this.consultationFee, this.consultationSwitch});

	SelectionBeanDataNewProfessor.fromJson(Map<String, dynamic> json) {
		if (json['topics'] != null) {
			topics = new List<SelectionBeanDataNewProfessorTopic>();(json['topics'] as List).forEach((v) { topics.add(new SelectionBeanDataNewProfessorTopic.fromJson(v)); });
		}
		helpCount = json['helpCount'];
		fansCount = json['fansCount'];
		consultationCount = json['consultationCount'];
		geniusName = json['GeniusName'];
		geniusID = json['GeniusID'];
		score = json['score'];
		geniusDescription = json['GeniusDescription'];
		userTags = json['userTags']?.cast<String>();
		photoUrl = json['PhotoUrl'];
		isProfessor = json['isProfessor'];
		consultationFee = json['consultationFee'];
		consultationSwitch = json['consultationSwitch'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.topics != null) {
      data['topics'] =  this.topics.map((v) => v.toJson()).toList();
    }
		data['helpCount'] = this.helpCount;
		data['fansCount'] = this.fansCount;
		data['consultationCount'] = this.consultationCount;
		data['GeniusName'] = this.geniusName;
		data['GeniusID'] = this.geniusID;
		data['score'] = this.score;
		data['GeniusDescription'] = this.geniusDescription;
		data['userTags'] = this.userTags;
		data['PhotoUrl'] = this.photoUrl;
		data['isProfessor'] = this.isProfessor;
		data['consultationFee'] = this.consultationFee;
		data['consultationSwitch'] = this.consultationSwitch;
		return data;
	}
}

class SelectionBeanDataNewProfessorTopic {
	Object topicId;
	Object topicAmount;
	Object topicDescription;
	Object topicTitle;

	SelectionBeanDataNewProfessorTopic({this.topicId, this.topicAmount, this.topicDescription, this.topicTitle});

	SelectionBeanDataNewProfessorTopic.fromJson(Map<String, dynamic> json) {
		topicId = json['topicId'];
		topicAmount = json['topicAmount'];
		topicDescription = json['topicDescription'];
		topicTitle = json['topicTitle'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['topicId'] = this.topicId;
		data['topicAmount'] = this.topicAmount;
		data['topicDescription'] = this.topicDescription;
		data['topicTitle'] = this.topicTitle;
		return data;
	}
}

class SelectionBeanDataGeniu {
	List<SelectionBeanDataGeniusTopic> topics;
	Object helpCount;
	Object fansCount;
	Object consultationCount;
	Object geniusName;
	Object geniusID;
	Object score;
	Object geniusDescription;
	List<String> userTags;
	Object photoUrl;
	Object isProfessor;
	Object consultationFee;
	Object consultationSwitch;

	SelectionBeanDataGeniu({this.topics, this.helpCount, this.fansCount, this.consultationCount, this.geniusName, this.geniusID, this.score, this.geniusDescription, this.userTags, this.photoUrl, this.isProfessor, this.consultationFee, this.consultationSwitch});

	SelectionBeanDataGeniu.fromJson(Map<String, dynamic> json) {
		if (json['topics'] != null) {
			topics = new List<SelectionBeanDataGeniusTopic>();(json['topics'] as List).forEach((v) { topics.add(new SelectionBeanDataGeniusTopic.fromJson(v)); });
		}
		helpCount = json['helpCount'];
		fansCount = json['fansCount'];
		consultationCount = json['consultationCount'];
		geniusName = json['GeniusName'];
		geniusID = json['GeniusID'];
		score = json['score'];
		geniusDescription = json['GeniusDescription'];
		userTags = json['userTags']?.cast<String>();
		photoUrl = json['PhotoUrl'];
		isProfessor = json['isProfessor'];
		consultationFee = json['consultationFee'];
		consultationSwitch = json['consultationSwitch'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.topics != null) {
      data['topics'] =  this.topics.map((v) => v.toJson()).toList();
    }
		data['helpCount'] = this.helpCount;
		data['fansCount'] = this.fansCount;
		data['consultationCount'] = this.consultationCount;
		data['GeniusName'] = this.geniusName;
		data['GeniusID'] = this.geniusID;
		data['score'] = this.score;
		data['GeniusDescription'] = this.geniusDescription;
		data['userTags'] = this.userTags;
		data['PhotoUrl'] = this.photoUrl;
		data['isProfessor'] = this.isProfessor;
		data['consultationFee'] = this.consultationFee;
		data['consultationSwitch'] = this.consultationSwitch;
		return data;
	}
}

class SelectionBeanDataGeniusTopic {
	Object topicId;
	Object topicAmount;
	Object topicDescription;
	Object topicTitle;

	SelectionBeanDataGeniusTopic({this.topicId, this.topicAmount, this.topicDescription, this.topicTitle});

	SelectionBeanDataGeniusTopic.fromJson(Map<String, dynamic> json) {
		topicId = json['topicId'];
		topicAmount = json['topicAmount'];
		topicDescription = json['topicDescription'];
		topicTitle = json['topicTitle'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['topicId'] = this.topicId;
		data['topicAmount'] = this.topicAmount;
		data['topicDescription'] = this.topicDescription;
		data['topicTitle'] = this.topicTitle;
		return data;
	}
}

class SelectionBeanDataPublicMeat {
	Object groupName;
	Object meatsOwner;
	Object meatsOwnerName;
	Object collectedNumber;
	Object mtid;
	Object meatsSourceDescription;
	Object meatsName;
	Object viewsNumber;
	Object type;
	Object groupID;
	Object entityID;
	Object meatsDescription;
	Object meatsOwnerCover;
	Object commentsNumber;
	Object meatsImageURL;
	List<SelectionBeanDataPublicMeatsMeatstag> meatsTags;
	Object isPublic;
	Object meatsBaseURL;
	Object timestamp;

	SelectionBeanDataPublicMeat({this.groupName, this.meatsOwner, this.meatsOwnerName, this.collectedNumber, this.mtid, this.meatsSourceDescription, this.meatsName, this.viewsNumber, this.type, this.groupID, this.entityID, this.meatsDescription, this.meatsOwnerCover, this.commentsNumber, this.meatsImageURL, this.meatsTags, this.isPublic, this.meatsBaseURL, this.timestamp});

	SelectionBeanDataPublicMeat.fromJson(Map<String, dynamic> json) {
		groupName = json['GroupName'];
		meatsOwner = json['MeatsOwner'];
		meatsOwnerName = json['MeatsOwnerName'];
		collectedNumber = json['CollectedNumber'];
		mtid = json['Mtid'];
		meatsSourceDescription = json['MeatsSourceDescription'];
		meatsName = json['MeatsName'];
		viewsNumber = json['viewsNumber'];
		type = json['type'];
		groupID = json['GroupID'];
		entityID = json['EntityID'];
		meatsDescription = json['MeatsDescription'];
		meatsOwnerCover = json['MeatsOwnerCover'];
		commentsNumber = json['commentsNumber'];
		meatsImageURL = json['MeatsImageURL'];
		if (json['MeatsTags'] != null) {
			meatsTags = new List<SelectionBeanDataPublicMeatsMeatstag>();(json['MeatsTags'] as List).forEach((v) { meatsTags.add(new SelectionBeanDataPublicMeatsMeatstag.fromJson(v)); });
		}
		isPublic = json['isPublic'];
		meatsBaseURL = json['MeatsBaseURL'];
		timestamp = json['timestamp'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['GroupName'] = this.groupName;
		data['MeatsOwner'] = this.meatsOwner;
		data['MeatsOwnerName'] = this.meatsOwnerName;
		data['CollectedNumber'] = this.collectedNumber;
		data['Mtid'] = this.mtid;
		data['MeatsSourceDescription'] = this.meatsSourceDescription;
		data['MeatsName'] = this.meatsName;
		data['viewsNumber'] = this.viewsNumber;
		data['type'] = this.type;
		data['GroupID'] = this.groupID;
		data['EntityID'] = this.entityID;
		data['MeatsDescription'] = this.meatsDescription;
		data['MeatsOwnerCover'] = this.meatsOwnerCover;
		data['commentsNumber'] = this.commentsNumber;
		data['MeatsImageURL'] = this.meatsImageURL;
		if (this.meatsTags != null) {
      data['MeatsTags'] =  this.meatsTags.map((v) => v.toJson()).toList();
    }
		data['isPublic'] = this.isPublic;
		data['MeatsBaseURL'] = this.meatsBaseURL;
		data['timestamp'] = this.timestamp;
		return data;
	}
}

class SelectionBeanDataPublicMeatsMeatstag {
	Object tagName;
	Object tagID;

	SelectionBeanDataPublicMeatsMeatstag({this.tagName, this.tagID});

	SelectionBeanDataPublicMeatsMeatstag.fromJson(Map<String, dynamic> json) {
		tagName = json['TagName'];
		tagID = json['TagID'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TagName'] = this.tagName;
		data['TagID'] = this.tagID;
		return data;
	}
}

class SelectionBeanDataGroup {
	Object groupName;
	Object groupOwnerName;
	Object groupOwnerId;
	Object subcribeNumber;
	Object groupAmount;
	Object groupImageURL;
	Object isMember;
	Object type;
	Object groupID;
	Object webImageUrl;
	Object relMeatsNumber;
	Object groupOwnerPhotoUrl;
	Object groupPurchaseStatus;
	Object hadSubscribed;
	Object groupPurchaseId;

	SelectionBeanDataGroup({this.groupName, this.groupOwnerName, this.subcribeNumber, this.groupAmount, this.groupImageURL, this.isMember, this.type, this.groupID, this.webImageUrl, this.relMeatsNumber, this.groupOwnerPhotoUrl, this.groupPurchaseStatus, this.hadSubscribed, this.groupPurchaseId});

	SelectionBeanDataGroup.fromJson(Map<String, dynamic> json) {
		groupName = json['GroupName'];
		groupOwnerName = json['groupOwnerName'];
		subcribeNumber = json['subcribeNumber']?? 0;
		groupAmount = json['GroupAmount'] ?? 0;
		groupImageURL = json['GroupImageURL'];
		isMember = json['isMember'];
		type = json['type'];
		groupID = json['GroupID'];
		webImageUrl = json['webImageUrl'];
		relMeatsNumber = json['relMeatsNumber'];
		groupOwnerPhotoUrl = json['groupOwnerPhotoUrl'];
		groupPurchaseStatus = json['groupPurchaseStatus'];
		hadSubscribed = json['hadSubscribed'];
		groupPurchaseId = json['groupPurchaseId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['GroupName'] = this.groupName;
		data['groupOwnerName'] = this.groupOwnerName;
		data['subcribeNumber'] = this.subcribeNumber;
		data['GroupAmount'] = this.groupAmount;
		data['GroupImageURL'] = this.groupImageURL;
		data['isMember'] = this.isMember;
		data['type'] = this.type;
		data['GroupID'] = this.groupID;
		data['webImageUrl'] = this.webImageUrl;
		data['relMeatsNumber'] = this.relMeatsNumber;
		data['groupOwnerPhotoUrl'] = this.groupOwnerPhotoUrl;
		data['groupPurchaseStatus'] = this.groupPurchaseStatus;
		data['hadSubscribed'] = this.hadSubscribed;
		data['groupPurchaseId'] = this.groupPurchaseId;
		return data;
	}
}

class SelectionBeanDataEvent {
	Object eventId;
	SelectionBeanDataEventsUserinfo userInfo;
	Object city;
	Object eventLocation;
	Object county;
	Object eventMemberCount;
	Object eventTitle;
	Object province;
	Object eventRebateDeadline;
	Object eventAmount;
	Object eventEndTime;
	Object eventPoster;
	Object eventRemainder;
	Object eventStartTime;
	Object place;

	SelectionBeanDataEvent({this.eventId, this.userInfo, this.city, this.eventLocation, this.county, this.eventMemberCount, this.eventTitle, this.province, this.eventRebateDeadline, this.eventAmount, this.eventEndTime, this.eventPoster, this.eventRemainder, this.eventStartTime, this.place});

	SelectionBeanDataEvent.fromJson(Map<String, dynamic> json) {
		eventId = json['eventId'];
		userInfo = json['userInfo'] != null ? new SelectionBeanDataEventsUserinfo.fromJson(json['userInfo']) : null;
		city = json['city'];
		eventLocation = json['eventLocation'];
		county = json['county'];
		eventMemberCount = json['eventMemberCount'];
		eventTitle = json['eventTitle'];
		province = json['province'];
		eventRebateDeadline = json['eventRebateDeadline'];
		eventAmount = json['eventAmount'];
		eventEndTime = json['eventEndTime'];
		eventPoster = json['eventPoster'];
		eventRemainder = json['eventRemainder'];
		eventStartTime = json['eventStartTime'];
		place = json['place'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['eventId'] = this.eventId;
		if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
		data['city'] = this.city;
		data['eventLocation'] = this.eventLocation;
		data['county'] = this.county;
		data['eventMemberCount'] = this.eventMemberCount;
		data['eventTitle'] = this.eventTitle;
		data['province'] = this.province;
		data['eventRebateDeadline'] = this.eventRebateDeadline;
		data['eventAmount'] = this.eventAmount;
		data['eventEndTime'] = this.eventEndTime;
		data['eventPoster'] = this.eventPoster;
		data['eventRemainder'] = this.eventRemainder;
		data['eventStartTime'] = this.eventStartTime;
		data['place'] = this.place;
		return data;
	}
}

class SelectionBeanDataEventsUserinfo {
	Object isPartner;
	Object userName;
	Object address;
	Object signature;
	Object paimeetID;
	Object fansCount;
	Object attentionCount;
	Object industry;
	Object photoUrl;
	Object aboutGenius;
	Object consultationFee;
	Object consultationSwitch;

	SelectionBeanDataEventsUserinfo({this.isPartner, this.userName, this.address, this.signature, this.paimeetID, this.fansCount, this.attentionCount, this.industry, this.photoUrl, this.aboutGenius, this.consultationFee, this.consultationSwitch});

	SelectionBeanDataEventsUserinfo.fromJson(Map<String, dynamic> json) {
		isPartner = json['isPartner'];
		userName = json['UserName'];
		address = json['address'];
		signature = json['Signature'];
		paimeetID = json['PaimeetID'];
		fansCount = json['fansCount'];
		attentionCount = json['attentionCount'];
		industry = json['industry'];
		photoUrl = json['PhotoUrl'];
		aboutGenius = json['aboutGenius'];
		consultationFee = json['consultationFee'];
		consultationSwitch = json['consultationSwitch'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isPartner'] = this.isPartner;
		data['UserName'] = this.userName;
		data['address'] = this.address;
		data['Signature'] = this.signature;
		data['PaimeetID'] = this.paimeetID;
		data['fansCount'] = this.fansCount;
		data['attentionCount'] = this.attentionCount;
		data['industry'] = this.industry;
		data['PhotoUrl'] = this.photoUrl;
		data['aboutGenius'] = this.aboutGenius;
		data['consultationFee'] = this.consultationFee;
		data['consultationSwitch'] = this.consultationSwitch;
		return data;
	}
}
