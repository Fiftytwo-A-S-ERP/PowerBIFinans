query 6042319 FtaPBIItemValueEntries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIItemValueEntries';

    elements
    {
        dataitem(Value_Entry; "Value Entry")
        {
            column(ItemNo; "Item No.")
            { }
            column(PostingDate; "Posting Date")
            { }
            column(ItemLedgerEntryType; "Item Ledger Entry Type")
            { }
            column(DocumentNo; "Document No.")
            { }
            column(Description; Description)
            { }
            column(LocationCode; "Location Code")
            { }
            column(InventoryPostingGroup; "Inventory Posting Group")
            { }
            column(ItemLedgerEntryQuantity; "Item Ledger Entry Quantity")
            { }
            column(CostAmountActual; "Cost Amount (Actual)")
            { }
            column(CostAmountExpected; "Cost Amount (Expected)")
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
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(ItemNo, '');
    end;
}