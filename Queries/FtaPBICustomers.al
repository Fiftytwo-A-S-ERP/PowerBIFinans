query 6042313 FtaPBICustomers
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'GroupName';
    APIVersion = 'v1.0';
    EntityName = 'FtaCustomers';
    EntitySetName = 'FtaPBICustomers';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            { }
            column(Name; Name)
            { }
            column(CountryRegionCode; "Country/Region Code")
            { }
            column(TerritoryCode; "Territory Code")
            { }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            { }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            { }
            column(CurrencyCode; "Currency Code")
            { }
            column(Amount; Amount)
            { }
            column(CreditLimitLCY; "Credit Limit (LCY)")
            { }
            column(Balance; Balance)
            { }
            column(BalanceLCY; "Balance (LCY)")
            { }
            column(BalanceDue; "Balance Due")
            { }
            column(BalanceDueLCY; "Balance Due (LCY)")
            { }
            column(CustomerPostingGroup; "Customer Posting Group")
            { }
            column(GenBusPostingGroup; "Gen. Bus. Posting Group")
            { }
            column(ResponsibilityCenter; "Responsibility Center")
            { }
            column(SalespersonCode; "Salesperson Code")
            { }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(No, '');
    end;
}