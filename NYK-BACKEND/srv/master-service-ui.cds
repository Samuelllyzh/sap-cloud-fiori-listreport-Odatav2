using MasterService from './master-service';


annotate MasterService.MASTER_001 with {
    companyCode            @title: '会社コード';
    fiscalYear             @title: '会計年度';
    fiscalPeriod           @title: '会計期間';
    sequence               @title: 'シーケンス番号';
    generalLedger          @title: '総勘定元帳勘定';
    vessel                 @title: 'VESSEL';
    textStr                @title: '明細テキスト';
    occurrenceDate         @title: '発生年月日';
    slipNo                 @title: '会計伝票番号';
    slipDetailNo           @title: '会計伝票内の明細番号';
    domesticCurrencyAmount @title: '国内通貨額';
    resultMessage          @title: '処理結果メッセージ';
    createUser             @title: '作成者';
    createDate             @title: '作成日時';
    createPGM              @title: '作成プログラムID';
    updateUser             @title: '最終更新者';
    updateDate             @title: '最終更新日時';
    updatePGM              @title: '最終更新プログラムID';
    deleteFlg              @title: '削除フラグ';

    // statusHelp             @(
    //     title : 'Status with Help',
    //     Common: {ValueList: {
    //         CollectionPath: 'Statuses',
    //         Parameters    : [
    //             {
    //                 $Type            : 'Common.ValueListParameterInOut',
    //                 LocalDataProperty: statusHelp_ID,
    //                 ValueListProperty: 'ID'
    //             },
    //             {
    //                 $Type            : 'Common.ValueListParameterDisplayOnly',
    //                 ValueListProperty: 'text'
    //             },
    //         ]
    //     }}
    // );
    // statusDropDown         @(
    //     title                          : 'Status with Dropdown',
    //     Common.ValueListWithFixedValues: true,
    // );
}

// 表示項目
annotate MasterService.MASTER_001 with @(UI: {
    // 検索条件
    SelectionFields: [
        companyCode,
        fiscalYear,
        fiscalPeriod
    ],
    // 一覧項目
    LineItem       : [
        {Value: companyCode},
        {Value: fiscalYear},
        {Value: fiscalPeriod},
        {Value: sequence},
        {Value: generalLedger},
        {Value: vessel},
        {Value: textStr},
        {Value: occurrenceDate},
        {Value: slipNo},
        {Value: slipNo},
        {Value: slipDetailNo},
        {Value: domesticCurrencyAmount},
        {Value: createUser},
        {Value: createDate},
        {Value: createPGM},
        {Value: updateUser},
        {Value: updateDate},
        {Value: updatePGM},
    ],
    // ObjectPageの定義
    FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : companyCode,
                Label : '会社コード'
            },
            {
                $Type : 'UI.DataField',
                Value : fiscalYear,
                Label : '会計年度'
            },
            {
                $Type : 'UI.DataField',
                Value : fiscalPeriod,
                Label : '会計期間'
            },
            {
                $Type : 'UI.DataField',
                Value : sequence,
                Label : 'シーケンス番号'
            },
            {
                $Type : 'UI.DataField',
                Value : generalLedger,
                Label : '総勘定元帳勘定'
            },
            {
                $Type : 'UI.DataField',
                Value : vessel,
                Label : 'VESSEL'
            },
            {
                $Type : 'UI.DataField',
                Value : textStr,
                Label : '明細テキスト'
            },
            {
                $Type : 'UI.DataField',
                Value : occurrenceDate,
                Label : '発生年月日'
            },
            {
                $Type : 'UI.DataField',
                Value : slipNo,
                Label : '会計伝票番号'
            },
            {
                $Type : 'UI.DataField',
                Value : slipDetailNo,
                Label : '会計伝票内の明細番号'
            },
            {
                $Type : 'UI.DataField',
                Value : domesticCurrencyAmount,
                Label : '国内通貨額'
            },
            {
                $Type : 'UI.DataField',
                Value : resultMessage,
                Label : '処理結果メッセージ'
            }
            
        ]
    },
    Facets              : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'ProjectsDetails',
            Target : '@UI.FieldGroup#Details',
            Label  : 'データ登録'
        }
    ]
});

// フィルター項目にディフォルト値をセット
// annotate MasterService.MASTER_001 with {
//     @Common.FilterDefaultValue : '1000'
//     companyCode
// };

// 一覧ボタン制御
// annotate MasterService.MASTER_001 with @(
//     Capabilities.InsertRestrictions: {Insertable: true},
//     Capabilities.DeleteRestrictions: {Deletable: true},
//     Capabilities.UpdateRestrictions: {Updatable: true}
// );

//annotate MasterService.MASTER_001 with @fiori.draft.enabled;

// 検索条件の制御
annotate MasterService.MASTER_001 with @Capabilities: {
    // ディフォルトの検索テキスト表示制御
    SearchRestrictions: {Searchable: false},
    // 検索項目を必須にする
    // FilterRestrictions: {
    //     $Type             : 'Capabilities.FilterRestrictionsType',
    //     RequiredProperties: [companyCode],
    // }
    // ,
    // FilterRestrictions: {FilterExpressionRestrictions: [{
    //     Property          : 'companyCode',
    //     AllowedExpressions: 'SingleValue'
    // }]},
};


// 明細画面項目定義
// annotate MasterService.MASTER_001 with @(
//     UI.FieldGroup #GeneratedGroup1: {
//         $Type: 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'ID',
//                 Value: companyCode,
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'bookName',
//                 Value: fiscalYear,
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'stock',
//                 Value: fiscalPeriod,
//             },
//         ],
//     },
//     UI.Facets                     : [{
//         $Type : 'UI.ReferenceFacet',
//         ID    : 'GeneratedFacet1',
//         Label : 'General Information',
//         Target: '@UI.FieldGroup#GeneratedGroup1',
//     }, ]
// );
