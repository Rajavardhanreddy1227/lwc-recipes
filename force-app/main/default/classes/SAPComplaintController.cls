public class SAPComplaintController {
        
        public string Notification_Num{get; set; }
        public string symbol{get; set; }
        public string name{get; set; }
        public string exchange{get; set; }
        /* public string Material_Num{get; set; }
    public string DefectType_Name{get; set; }
    public string CustomerComplaint_Points{get; set; }
    public string CustomerDowntime_Minutes{get; set; }
    public string WorkOrder_Num{get; set; }
    public string Material_Description{get; set; }*/
        public SAP_Complaint__c Sapcomplaint{get; set; }
        public SAPComplaintController() {
            Sapcomplaint = new SAP_Complaint__c();
            
            
        }
        public SAPComplaintController(Apexpages.standardSetController str){
            Sapcomplaint = new SAP_Complaint__c();
            
        }
        public void Sapcallout(){
            Sapcomplaint = new SAP_Complaint__c();
            HttpRequest req = new HttpRequest();
            HttpResponse res = new HttpResponse();
            Http http = new Http();
            //req.setEndpoint('https://financialmodelingprep.com/api/v3/quote/AAPL?apikey=80d6ef5282e15e64795b8d684275c702?notifType=Z7&SAP_NOTIF_NO=' +Notification_NUM);
            req.setEndpoint('https://financialmodelingprep.com/api/v3/quote/AAPL?apikey=80d6ef5282e15e64795b8d684275c702');
            
            req.setMethod('GET');
            res = http.send(req);
            system.debug('res=======>'+res);
            system.debug('res=======>'+res.getBody());
            
            if(res.getstatusCode() == 200 && res.getbody() != null){
                //JSON2Apex responseJson =(JSON2Apex)json.deserialize(res.getbody(),JSON2Apex.class);
                JSON2Apex responseJson = new JSON2Apex();
                responseJson = responseJson.parse(res.getbody()).get(0);
                system.debug('$$$$'+responseJson);
                Sapcomplaint.Symbol__c = responseJson.symbol;
                Sapcomplaint.name = responseJson.name;
                Sapcomplaint.exchange__c = responseJson.exchange;
                
                /*Sapcomplaint.Price__c = responseJson.price;
    Sapcomplaint.changesPercentage__c = responseJson.changesPercentage;
    Sapcomplaint.dayLow__c = responseJson.dayLow;
    /*Sapcomplaint.dayHigh = responseJson.dayHigh;
    Sapcomplaint.yearHigh = responseJson.yearHigh;
    Sapcomplaint.yearLow = responseJson.yearLow;
    Sapcomplaint.marketCap = responseJson.marketCap;
    Sapcomplaint.priceAvg50 = responseJson.priceAvg50;
    Sapcomplaint.priceAvg200 = responseJson.priceAvg200;
    Sapcomplaint.volume = responseJson.volume;
    Sapcomplaint.avgVolume = responseJson.avgVolume;
    Sapcomplaint.previousClose = responseJson.previousClose;
    Sapcomplaint.eps = responseJson.eps;
    Sapcomplaint.pe = responseJson.pe;
    Sapcomplaint.earningsAnnouncement = responseJson.earningsAnnouncement;
    Sapcomplaint.sharesOutstanding = responseJson.sharesOutstanding;
    Sapcomplaint.timestamp = responseJson.timestamp;*/
                
                
            }
        }
        
        public PageReference saveSAP(){
            insert Sapcomplaint;
            Return new PageReference('/'+Sapcomplaint.id);
        }
        public class JSON2Apex {
            
            public String symbol {get;set;} 
            public String name {get;set;} 
            public Double price {get;set;} 
            public Double changesPercentage {get;set;} 
            public Double change {get;set;} 
            public Double dayLow {get;set;} 
            public Double dayHigh {get;set;}
            public Double yearHigh {get;set;} 
            public Double yearLow {get;set;} 
            public Double marketCap {get;set;} 
            public Double priceAvg50 {get;set;} 
            public Double priceAvg200 {get;set;} 
            public Integer volume {get;set;} 
            public Integer avgVolume {get;set;} 
            public String exchange {get;set;} 
            public Double open {get;set;} 
            public Double previousClose {get;set;} 
            public Double eps {get;set;} 
            public Double pe {get;set;} 
            public String earningsAnnouncement {get;set;} 
            public Long sharesOutstanding {get;set;} 
            public Integer timestamp {get;set;} 
            public JSON2Apex() {}
            
            public JSON2Apex(JSONParser parser) {
                while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                    if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                        String text = parser.getText();
                        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                            if (text == 'symbol') {
                                symbol = parser.getText();
                            } else if (text == 'name') {
                                name = parser.getText();
                            } else if (text == 'price') {
                                price = parser.getDoubleValue();
                            } else if (text == 'changesPercentage') {
                                changesPercentage = parser.getDoubleValue();
                            } else if (text == 'change') {
                                change = parser.getDoubleValue();
                            } else if (text == 'dayLow') {
                                dayLow = parser.getDoubleValue();
                            } else if (text == 'dayHigh') {
                                dayHigh = parser.getDoubleValue();
                            } else if (text == 'yearHigh') {
                                yearHigh = parser.getDoubleValue();
                            } else if (text == 'yearLow') {
                                yearLow = parser.getDoubleValue();
                            } else if (text == 'marketCap') {
                                marketCap = parser.getDoubleValue();
                            } else if (text == 'priceAvg50') {
                                priceAvg50 = parser.getDoubleValue();
                            } else if (text == 'priceAvg200') {
                                priceAvg200 = parser.getDoubleValue();
                            } else if (text == 'volume') {
                                volume = parser.getIntegerValue();
                            } else if (text == 'avgVolume') {
                                avgVolume = parser.getIntegerValue();
                            } else if (text == 'exchange') {
                                exchange = parser.getText();
                            } else if (text == 'open') {
                                open = parser.getDoubleValue();
                            } else if (text == 'previousClose') {
                                previousClose = parser.getDoubleValue();
                            } else if (text == 'eps') {
                                eps = parser.getDoubleValue();
                            } else if (text == 'pe') {
                                pe = parser.getDoubleValue();
                            } else if (text == 'earningsAnnouncement') {
                                earningsAnnouncement = parser.getText();
                            } else if (text == 'sharesOutstanding') {
                                sharesOutstanding = parser.getLongValue();
                            } else if (text == 'timestamp') {
                                timestamp = parser.getIntegerValue();
                            } else {
                                System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
                                consumeObject(parser);
                            }
                        }
                    }
                }
            }
            
            
            public  List<JSON2Apex> parse(String json) {
                System.JSONParser parser = System.JSON.createParser(json);
                return arrayOfJSON2Apex(parser);
            }
            
            public  void consumeObject(System.JSONParser parser) {
                Integer depth = 0;
                do {
                    System.JSONToken curr = parser.getCurrentToken();
                    if (curr == System.JSONToken.START_OBJECT || 
                        curr == System.JSONToken.START_ARRAY) {
                            depth++;
                        } else if (curr == System.JSONToken.END_OBJECT ||
                                   curr == System.JSONToken.END_ARRAY) {
                                       depth--;
                                   }
                } while (depth > 0 && parser.nextToken() != null);
            }
            
            
            
            private  List<JSON2Apex> arrayOfJSON2Apex(System.JSONParser p) {
                List<JSON2Apex> res = new List<JSON2Apex>();
                if (p.getCurrentToken() == null) p.nextToken();
                while (p.nextToken() != System.JSONToken.END_ARRAY) {
                    res.add(new JSON2Apex(p));
                }
                return res;
            }
            
            
            
        }
        public PageReference save(){
            update Sapcomplaint;
            return null;
        }
        public PageReference Cancel(){
            return null;
        }
        
        
        
        
    }