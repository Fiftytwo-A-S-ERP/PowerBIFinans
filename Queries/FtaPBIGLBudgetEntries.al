query 6042312 FtaPBIGLBudgetEntries
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIGLBudgetEntries';

    elements
    {
        dataitem(G_L_Budget_Entry; "G/L Budget Entry")
        {
            column(GLAccountNo; "G/L Account No.")
            { }
            column(Date; Date)
            { }
            column(BudgetName; "Budget Name")
            { }
            column(Description; Description)
            { }
            column(Amount; Amount)
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
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(GLAccountNo, '');
    end;
}