query 6042315 FtaPBIDetailedcustomerentries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIDetailedcustomerentries';

    elements
    {
        dataitem(Detailed_Cust__Ledg__Entry; "Detailed Cust. Ledg. Entry")
        {
            column(PostingDate; "Posting Date")
            { }
            column(CustLedgerEntryNo; "Cust. Ledger Entry No.")
            { }
            column(Amount; Amount)
            { }
            column(AmountLCY; "Amount (LCY)")
            { }
            column(InitialEntryDueDate; "Initial Entry Due Date")
            { }
            column(EntryNo; "Entry No.")
            { }
            column(EntryType; "Entry Type")
            { }
            column(DocumentNo; "Document No.")
            { }
            column(DocumentType; "Document Type")
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
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(EntryNo, 0);
    end;
}