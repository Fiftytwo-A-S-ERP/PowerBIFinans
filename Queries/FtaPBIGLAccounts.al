query 6042310 FtaPBIGLAccounts
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIGLAccounts';

    elements
    {
        dataitem(G_L_Account; "G/L Account")
        {
            column(No; "No.")
            { }
            column(Name; Name)
            { }
            column(IncomeBalance; "Income/Balance")
            { }
            column(AccountCategory; "Account Category")
            { }
            column(AccountType; "Account Type")
            { }
            column(AccountSubcategoryDescript; "Account Subcategory Descript.")
            { }
            column(NetChange; "Net Change")
            { }
            column(Balance; Balance)
            { }
            column(DirectPosting; "Direct Posting")
            { }
            column(Totaling; Totaling)
            { }
            column(GenPostingType; "Gen. Posting Type")
            { }
            column(GenBusPostingGroup; "Gen. Bus. Posting Group")
            { }
            column(GenProdPostingGroup; "Gen. Prod. Posting Group")
            { }
            column(VATBusPostingGroup; "VAT Bus. Posting Group")
            { }
            column(VATProdPostingGroup; "VAT Prod. Posting Group")
            { }
            column(DebitAmount; "Debit Amount")
            { }
            column(CreditAmount; "Credit Amount")
            { }
            column(BalanceatDate; "Balance at Date")
            { }
            column(AdditionalCurrencyNetChange; "Additional-Currency Net Change")
            { }
            column(AddCurrencyBalanceatDate; "Add.-Currency Balance at Date")
            { }
            column(AdditionalCurrencyBalance; "Additional-Currency Balance")
            { }
            column(ConsolDebitAcc; "Consol. Debit Acc.")
            { }
            column(ConsolCreditAcc; "Consol. Credit Acc.")
            { }
            column(CostTypeNo; "Cost Type No.")
            { }
            column(ConsolTranslationMethod; "Consol. Translation Method")
            { }
            column(DefaultICPartnerGLAccNo; "Default IC Partner G/L Acc. No")
            { }
            column(DefaultDeferralTemplateCode; "Default Deferral Template Code")
            { }
            column(AccountSubcategory; "Account Subcategory Entry No.")
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