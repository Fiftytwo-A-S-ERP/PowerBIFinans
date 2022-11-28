query 6042318 FtaPBIBankentries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIBankentries';

    elements
    {
        dataitem(Bank_Account_Ledger_Entry; "Bank Account Ledger Entry")
        {
            column(BankAccountNo; "Bank Account No.")
            { }
            column(PostingDate; "Posting Date")
            { }
            column(Amount; Amount)
            { }
            column(AmountLCY; "Amount (LCY)")
            { }
            column(CurrencyCode; "Currency Code")
            { }
            column(DimensionSetID; "Dimension Set ID")
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
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(BankAccountNo, '');
    end;
}