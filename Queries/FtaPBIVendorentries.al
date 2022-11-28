query 6042316 FtaPBIVendorentries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIVendorentries';

    elements
    {
        dataitem(Vendor_Ledger_Entry; "Vendor Ledger Entry")
        {
            column(VendorNo; "Vendor No.")
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
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(VendorNo, '');
    end;
}