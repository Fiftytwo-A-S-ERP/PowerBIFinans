query 6042311 FtaPBIGLEntries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIGLEntries';

    elements
    {
        dataitem(G_L_Entry; "G/L Entry")
        {
            column(GLAccountNo; "G/L Account No.")
            { }
            column(PostingDate; "Posting Date")
            { }
            column(DocumentNo; "Document No.")
            { }
            column(Description; Description)
            { }
            column(Amount; Amount)
            { }
            column(DimensionSetID; "Dimension Set ID")
            { }
            column(SourceCode; "Source Code")
            { }
            column(SourceType; "Source Type")
            { }
            column(SourceNo; "Source No.")
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
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(GLAccountNo, '');
    end;
}