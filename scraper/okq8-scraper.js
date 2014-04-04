var DEBUG = false;

var casper = require('casper').create({
    verbose: DEBUG,
    logLevel: "debug"
});

var system = require('system');

var i = 0;

var capture = function(obj) {
    if (DEBUG) {
        obj.capture(['loggedin-', i.toString(), '.png'].join(''));
        i = i + 1;
    }
};

var user = casper.cli.get('user');
var password = casper.cli.get('password');

casper.start('https://nettbank.edb.com/Logon/index.jsp?to_page=https://nettbank.edb.com/cardpayment/transigo/logon/done/okq8&from_page=http://www.okq8.se&domain=0066', function() {
        this.fillSelectors('form[action*="/Logon/logon/step1"]', {
            'input[name=user_id]': user,
            'input[name=password]': password
        }, true);
});

casper.then(function() {
    capture(this);
    this.click('a[href="/cardpayment/transigo/card/overview/invoiceDetails"]');
});

casper.then(function() {
    capture(this);
    var statementPdf = this.getElementAttribute('a[href^="/cardpayment/pdfviewer/PdfViewerServlet"]:first-child', 'href');
    var downloadUrl = 'https://nettbank.edb.com' + statementPdf
    this.download(downloadUrl, 'statement.pdf');
});

casper.run();
