public class BigTest {
    public static List<Realtor__c> test_realtors;
    public static List<Customer__c> test_customers;
    public static List<Neighborhood__c> test_neighborhoods;
    public static List<Lot__c> test_lots;

    public static void mainSetup(){
        test_customers = new List<Customer__c>();
        makeRealtors();

        test_customers = new List<Customer__c>();
        makeCustomers();

        test_neighborhoods = new List<Neighborhood__c>();
        makeNeighborhoods();

        test_lots = new List<Lot__C>();
        makeLots();
    }

    private static void makeRealtors(){
        test_realtors = new List<Realtor__c>();

        test_realtors.add(new Realtor__c(Name = 'Mike Tyson', Realtor_Agency__c = 'Agency A'));
        test_realtors.add(new Realtor__c(Name = 'Ted Williams', Realtor_Agency__c = 'Agency A'));
        test_realtors.add(new Realtor__c(Name = 'Michael Jordan', Realtor_Agency__c = 'Agency A'));

        test_realtors.add(new Realtor__c(Name = 'Tiger Woods', Realtor_Agency__c = 'Agency B'));
        test_realtors.add(new Realtor__c(Name = 'Wayne Gretzky', Realtor_Agency__c = 'Agency B'));

        test_realtors.add(new Realtor__c(Name = 'Joe Montana', Realtor_Agency__c = 'Agency C'));

        insert test_realtors;
    }

    private static void makeCustomers(){
        test_customers.add(new Customer__c(Name = 'Bob Johnson', Status__c = 'Buyer', Realtor__c = test_realtors[0].Id));

        test_customers.add(new Customer__c(Name = 'Jane Jackson', Status__c = 'Buyer', Realtor__c = test_realtors[1].Id));
        test_customers.add(new Customer__c(Name = 'Jill Jorson', Status__c = 'Buyer', Realtor__c = test_realtors[1].Id));
        test_customers.add(new Customer__c(Name = 'Mark Markson', Status__c = 'Buyer', Realtor__c = test_realtors[1].Id));
        
        test_customers.add(new Customer__c(Name = 'Matt Sonson', Status__c = 'Buyer', Realtor__c = test_realtors[2].Id));
        test_customers.add(new Customer__c(Name = 'Pedro Bobson', Status__c = 'Buyer', Realtor__c = test_realtors[2].Id));

        
        test_customers.add(new Customer__c(Name = 'Katie Kaleson', Status__c = 'Buyer', Realtor__c = test_realtors[3].Id));
        
        test_customers.add(new Customer__c(Name = 'Barbara Langson', Status__c = 'Buyer', Realtor__c = test_realtors[4].Id));
        test_customers.add(new Customer__c(Name = 'Steve Macson', Status__c = 'Buyer', Realtor__c = test_realtors[4].Id));
        test_customers.add(new Customer__c(Name = 'Mac Steveson', Status__c = 'Buyer', Realtor__c = test_realtors[4].Id));
        

        test_customers.add(new Customer__c(Name = 'John Barbson', Status__c = 'Buyer', Realtor__c = test_realtors[5].Id));
        test_customers.add(new Customer__c(Name = 'Joe Thorson', Status__c = 'Buyer', Realtor__c = test_realtors[5].Id));
        test_customers.add(new Customer__c(Name = 'Allie Alson', Status__c = 'Buyer', Realtor__c = test_realtors[5].Id));

        insert test_customers;
    }

    private static void makeNeighborhoods(){
        test_neighborhoods.add(new Neighborhood__c(Name = 'West Philadelphia'));
        test_neighborhoods.add(new Neighborhood__c(Name = 'North Salt Lake City'));
        test_neighborhoods.add(new Neighborhood__c(Name = 'New San Diego'));

        insert test_neighborhoods;
    }

    private static void makeLots(){
        test_lots.add(new Lot__c(Name = 'WP1', Status__c = 'Developed', Neighborhood__c = test_neighborhoods[0].Id, Customer__c = test_customers[0].Id));
        test_lots.add(new Lot__c(Name = 'WP2', Status__c = 'Construction Complete', Neighborhood__c = test_neighborhoods[0].Id, Customer__c = test_customers[0].Id));
        test_lots.add(new Lot__c(Name = 'WP3', Status__c = 'Construction Complete', Neighborhood__c = test_neighborhoods[0].Id, Customer__c = test_customers[2].Id));
        test_lots.add(new Lot__c(Name = 'WP4', Status__c = 'Under Construction', Neighborhood__c = test_neighborhoods[0].Id, Customer__c = test_customers[2].Id));
        test_lots.add(new Lot__c(Name = 'WP5', Status__c = 'Under Construction', Neighborhood__c = test_neighborhoods[0].Id, Customer__c = test_customers[3].Id));

        test_lots.add(new Lot__c(Name = 'NSLC1', Status__c = 'Under Construction', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[1].Id));
        test_lots.add(new Lot__c(Name = 'NSLC2', Status__c = 'Acquiring Permits', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[3].Id));
        test_lots.add(new Lot__c(Name = 'NSLC3', Status__c = 'Under Construction', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[4].Id));
        test_lots.add(new Lot__c(Name = 'NSLC4', Status__c = 'Developed', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[6].Id));
        test_lots.add(new Lot__c(Name = 'NSLC5', Status__c = 'Developed', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[6].Id));
        test_lots.add(new Lot__c(Name = 'NSLC6', Status__c = 'Acquiring Permits', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[6].Id));
        test_lots.add(new Lot__c(Name = 'NSLC7', Status__c = 'Developed', Neighborhood__c = test_neighborhoods[1].Id));
        test_lots.add(new Lot__c(Name = 'NSLC8', Status__c = 'Developed', Neighborhood__c = test_neighborhoods[1].Id));
        test_lots.add(new Lot__c(Name = 'NSLC9', Status__c = 'Construction Complete', Neighborhood__c = test_neighborhoods[1].Id, Customer__c = test_customers[7].Id));

        test_lots.add(new Lot__c(Name = 'NSD1', Status__c = 'Acquiring Permits', Neighborhood__c = test_neighborhoods[2].Id, Customer__c = test_customers[8].Id));
        test_lots.add(new Lot__c(Name = 'NSD2', Status__c = 'Under Construction', Neighborhood__c = test_neighborhoods[2].Id, Customer__c = test_customers[8].Id));
        test_lots.add(new Lot__c(Name = 'NSD3', Status__c = 'Construction Complete', Neighborhood__c = test_neighborhoods[2].Id, Customer__c = test_customers[9].Id));
        test_lots.add(new Lot__c(Name = 'NSD4', Status__c = 'Construction Complete', Neighborhood__c = test_neighborhoods[2].Id));
        test_lots.add(new Lot__c(Name = 'NSD5', Status__c = 'Under Construction', Neighborhood__c = test_neighborhoods[2].Id, Customer__c = test_customers[11].Id));
        test_lots.add(new Lot__c(Name = 'NSD6', Status__c = 'Acquiring Permits', Neighborhood__c = test_neighborhoods[2].Id, Customer__c = test_customers[11].Id));
        test_lots.add(new Lot__c(Name = 'NSD7', Status__c = 'Construction Complete', Neighborhood__c = test_neighborhoods[2].Id));

        insert test_lots;
    }
}