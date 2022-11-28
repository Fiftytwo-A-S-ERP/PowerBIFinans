query 6042320 FtaPBIFAEntries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIFTLFAEntries';

    elements
    {
        dataitem(FA_Ledger_Entry; "FA Ledger Entry")
        {
            column(FANo; "FA No.")
            { }
            column(DocumentNo; "Document No.")
            { }
            column(FAPostingDate; "FA Posting Date")
            { }
            column(FAPostingType; "FA Posting Type")
            { }
            column(AmountLCY; "Amount (LCY)")
            {
                Method = Sum;
            }
            column(FAPostingCategory; "FA Posting Category")
            { }
            column(ReasonCode; "Reason Code")
            { }
            column(Depreciation_Book_Code; "Depreciation Book Code")
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
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(FANo, '');
    end;
}