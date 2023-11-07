sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        beforeSaveExtension: function () {
			var fnResolve, fnReject;
			var oPromise = new Promise(function (resolve, reject){
				fnResolve = resolve;
				fnReject = reject;
			});
			this.oDialog = new sap.m.Dialog({
				title: "BeforeSaveExtension",
				content: new sap.m.Text({
					text: "This is an exmpale to check the beforeSaveExtension"
				}),
				beginButton: new sap.m.Button({
					text: "Continue to Save",
					press: function () {
						fnResolve();
						this.oDialog.close();
					}.bind(this)
				}),
				endButton: new sap.m.Button({
					text: "Cancel Save",
					press: function () {
						fnReject();
						this.oDialog.close();
					}.bind(this)
				})
			});
			this.getView().addDependent(this.oDialog);
			this.oDialog.open();
			return oPromise;
		}
    };
});