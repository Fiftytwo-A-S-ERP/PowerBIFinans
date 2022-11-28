query 6042314 FtaPBICustomerentries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBICustomerentries';

    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {
            column(CustomerNo; "Customer No.")
            { }
            column(PostingDate; "Posting Date")
            { }
            column(DocumentNo; "Document No.")
            { }
            column(DocumentType; "Document Type")
            { }
            column(Description; Description)
            { }
            column(CurrencyCode; "Currency Code")
            { }
            column(DueDate; "Due Date")
            { }
            column(DimensionSetID; "Dimension Set ID")
            { }
            column(Amount; Amount)
            { }
            column(RemainingAmount; "Remaining Amount")
            { }
            column(AmountLCY; "Amount (LCY)")
            { }
            column(RemainingAmtLCY; "Remaining Amt. (LCY)")
            { }
            column(EntryNo; "Entry No.")
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