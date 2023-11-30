entity Tooks {
  key ID    : Integer;
      title : String;
      stock : Integer;
      TIMESTR: Time;
}

@cds.persistence.exists
entity MASTER_001 {
  key GENERALLEDGER     : String(10);
      GENERALLEDGERNAME : String(50);
}

@assert.unique: {uniquecheck: [
  companyCode,
  fiscalYear,
  fiscalPeriod,
  sequence,
  generalLedger,
  vessel
]}
@cds.persistence.exists
@cds.persistence.view
// @(restrict: [
//     { grant: 'READ', to: 'Admin'  },
//     { grant: 'WRITE', to: 'Vendor', where: '$user.publishers = publisher' },
//     { grant: 'WRITE', to: 'Admin' } ])
entity MASTER {
      // 会社コード
      @Core.Immutable
      @mandatory
  key companyCode            : String(4);

      // 会計年度
      @Core.Immutable
      @assert.format: '^[0-9]*$'
      @mandatory
  key fiscalYear             : String(4);

      // 会計期間
      @Core.Immutable
      @mandatory
      @assert.range
      @Validation.AllowedValues
  key fiscalPeriod           : String(2) enum {
        Jan   = '01';
        Feb   = '02';
        Mar   = '03';
        Apr   = '04';
        May   = '05';
        Jun   = '06';
        Jul   = '07';
        Aug   = '08';
        Sep   = '09';
        Oct   = '10';
        Nov   = '11';
        Dec   = '12';
      };

      // シーケンス番号
      @Core.Immutable
      @mandatory
  key sequence               : String(10);

      // 総勘定元帳勘定
      @Core.Immutable
      @mandatory
  key generalLedger          : String(10);
      toGL      : Association to one MASTER_001 on toGL.GENERALLEDGER = $self.generalLedger @UI.HiddenFilter;


      GENERALLEDGERNAME = toGL.GENERALLEDGERNAME @title : 'テキスト(長) ';
      // VESSEL
      @Core.Immutable
      @mandatory
  key vessel                 : String(3);
      // 明細テキスト
      textStr                : String(50);
      // 発生年月日
      occurrenceDate         : Date;
      // 会計伝票番号
      slipNo                 : Time;

      // 会計伝票内の明細番号
      slipDetailNo           : String(3);
      //slipDetailNo      : String(3);
      // 国内通貨額
      domesticCurrencyAmount : Decimal(17);
      // 処理結果メッセージ
      resultMessage          : String(255);
      //作成者
      @cds.on.insert:$user
      createUser             : String(255) ;
      //作成日時
      @cds.on.insert:$now
      createDate             : Timestamp ;
      //作成プログラムID
      @cds.on.insert:'CreateLIYANG'
      createPGM              : String(255);
      //最終更新者
      @cds.on.insert:$user
      @cds.on.update:$user
      updateUser             : String(255) ;
      //最終更新日時
      @cds.on.insert:$now
      @cds.on.update:$now
      updateDate             : Timestamp ;
      //最終更新プログラムID
      @cds.on.insert:'CreateLIYANG'
      @cds.on.update:'UpdateLIYANG'
      updatePGM              : String(255) ;
      //削除フラグ
      deleteFlg              : Boolean;

        LIMITTIME :Time;
// statusHelp : Association to Statuses;
// statusDropDown : Association to Statuses;
}
