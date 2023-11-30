entity MASTER {
  // 会社コード
  key companyCode : String; 
  // 会計年度
  key fiscalYear      : String;
  // 会計期間
  key fiscalPeriod    : String;
  // シーケンス番号
  key sequence        : String;
  // 総勘定元帳勘定
  key generalLedger   : String; 
  // VESSEL
  key vessel          : String;
  // 明細テキスト
  textStr         : String;
  // 発生年月日
  occurrenceDate  : Date;
  // 会計伝票番号
  slipNo          : String;
  // 会計伝票内の明細番号
  slipDetailNo      : String;
  // 国内通貨額
  domesticCurrencyAmount  :Decimal;
  // 処理結果メッセージ
  resultMessage    : String;
  //作成者
  createUser      : String;
  //作成日時
  createDate      : DateTime;
  //作成プログラムID
  createPGM       : String;
  //最終更新者
  updateUser      : String;
  //最終更新日時
  updateDate      : DateTime;
  //最終更新プログラムID
  updatePGM       : String;
  //削除フラグ
  deleteFlg       :Boolean @UI.Hidden;

}
