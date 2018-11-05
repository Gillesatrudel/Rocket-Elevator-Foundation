$(document).ready(function () {

    document.getElementById("numElev_2").readOnly = true;
    document.getElementById("numElev_3").readOnly = true;
    document.getElementById("elevPriceUnit").readOnly = true;
    document.getElementById("elevTotal").readOnly = true;
    document.getElementById("installationFee").readOnly = true;
    document.getElementById("total_").readOnly = true;

    let numApp;
    let numFloors;
    let numBase;
    let numTower;
    let numElev;
    let maxOcc;
    let totalMaxOcc;
    let numAverElev;
    let finNumElev;
    let totalNumFloors;
    let roughTotal;
    let total;
    let installFee;
    let prodRange;

    


    $('#numApp').on('keyup', function () {
        doCalc();
    });

    $('#numFloors').on('keyup', function () {
        doCalc();
    });

    $('#numBase').on('keyup', function () {
        doCalc();
    });

    $('#numComp').on('keyup', function () {
        doCalc();
    });

    $('#numPark').on('keyup', function () {
        doCalc();
    });

    $('#numElev').on('keyup', function () {
        doCalc();
    });

    $('#numCorpo').on('keyup', function () {
        doCalc();
    });

    $('#maxOcc').on('keyup', function () {
        doCalc();
    });

    $('#busiHours').on('keyup', function () {
        doCalc();
    });

    $('#standard').on('click', function () {
        document.getElementById('elevPriceUnit').value = (7565).toFixed(2) + " $";
        doCalc();
    });

    $('#premium').on('click', function () {
        document.getElementById('elevPriceUnit').value = (12345).toFixed(2) + " $";
        doCalc();
    });

    $('#excelium').on('click', function () {
        document.getElementById('elevPriceUnit').value = (15400).toFixed(2) + " $";
        doCalc();
    });

    $('#residential').on('click', function () {
        initialize();
        document.getElementById('type').value = "residential";
        console.log(document.getElementById('type').value);
    });

    $('#commercial').on('click', function () {
        initialize();
        document.getElementById('type').value = "commercial";
        console.log(document.getElementById('type').value);
    });

    $('#corporate').on('click', function () {
        initialize();
        document.getElementById('type').value = "corporate";
        console.log(document.getElementById('type').value);
    });

    $('#hybrid').on('click', function () {
        initialize();
        document.getElementById('type').value = "hybrid";
        console.log(document.getElementById('type').value);
    });

    function initialize() {
        $('#numElev_2').val('');
        $('#numElev_3').val('');
        $('#elevPriceUnit').val('');
        $('#elevTotal').val('');
        $('#installationFee').val('');
        $('#total_').val('');
        $('#numApp').val('');
        $('#numFloors').val('');
        $('#numBase').val('');
        $('#numComp').val('');
        $('#numPark').val('');
        $('#numElev').val('');
        $('#numCorpo').val('');
        $('#maxOcc').val('');
        $('#busiHours').val('');
        $('#standard').prop('checked', false);
        $('#premium').prop('checked', false);
        $('#excelium').prop('checked', false);
    };

    

    function getInfoNumApp() {
        numApp = document.getElementById('numApp').value;
        return parseFloat(numApp);
    };

    function getInfoNumFloors() {
        numFloors = document.getElementById('numFloors').value;
        return parseFloat(numFloors);
    };

    function getInfoNumBase() {
        numBase = document.getElementById('numBase').value;
        return parseFloat(numBase);
    };

    function getInfoNumElev() {
        numElev = document.getElementById('numElev').value;
        return parseFloat(numElev);
    };

    function getInfoMaxOcc() {
        maxOcc = document.getElementById('maxOcc').value;
        return parseFloat(maxOcc);
    };

    function getProdRange() {
        if ($('#standard').is(':checked')) {
            prodRange = 7565;
            return parseFloat(prodRange)

        } else if ($('#premium').is(':checked')) {
            prodRange = 12345;
            return parseFloat(prodRange)

        } else {
            prodRange = 15400;
            return parseFloat(prodRange)
        }
    };

    function GetInfos() {
        getInfoNumApp();
        getInfoNumFloors();
        getInfoNumBase();
        getInfoNumElev();
        getInfoMaxOcc();
        getProdRange();
    };

    function setFirstResult(finNumElev) {
        document.getElementById('numElev_2').value = parseFloat(finNumElev);
        document.getElementById('numElev_3').value = parseFloat(finNumElev);
    };

    function setResult(finNumElev, roughTotal, installFee, total) {
        document.getElementById('numElev_2').value = parseFloat(finNumElev);
        document.getElementById('numElev_3').value = parseFloat(finNumElev);
        document.getElementById('elevTotal').value = parseFloat(roughTotal).toFixed(2) + " $";
        document.getElementById('installationFee').value = parseFloat(installFee).toFixed(2) + " $";
        document.getElementById('total_').value = parseFloat(total).toFixed(2) + " $";
    };

    function CalcRes(numApp, numFloors, prodRange) {
        //Calculate number of elevators required
        numElev = Math.ceil((numApp / numFloors) / 6);

        //Multiplying for every 20 additional floors and setting final number of elevators required
        finNumElev = numElev * Math.ceil(numFloors / 20);

        //Apply formula depending on Product Range and getting total before install fees
        roughTotal = prodRange * finNumElev;

        //Calculate Installation Fees and get final total
        if (prodRange == 7565) {
            installFee = roughTotal * 0.1;
            total = roughTotal + installFee;
        } else if (prodRange == 12345) {
            installFee = roughTotal * 0.13;
            total = roughTotal + installFee;
        } else {
            installFee = roughTotal * 0.16;
            total = roughTotal + installFee;
        };
        setResult(finNumElev, roughTotal, installFee, total);
    };

    function CalcCom(numElev, prodRange) {

        finNumElev = numElev;

        //Apply formula depending on Product Range and getting total before install fees
        roughTotal = prodRange * finNumElev;

        //Calculate Installation Fees and get final total
        if (prodRange == 7565) {
            installFee = roughTotal * 0.1;
            total = roughTotal + installFee;
        } else if (prodRange == 12345) {
            installFee = roughTotal * 0.13;
            total = roughTotal + installFee;
        } else {
            installFee = roughTotal * 0.16;
            total = roughTotal + installFee;
        };

        setResult(finNumElev, roughTotal, installFee, total);
    };

    function CalcCorpHyb(numFloors, numBase, maxOcc, prodRange) {

        // Add number of floors and basements
        totalNumFloors = numFloors + numBase;

        //Get total occupancy
        totalMaxOcc = maxOcc * totalNumFloors;

        //Get required elevators
        numElev = totalMaxOcc / 1000;

        //Get required elevator tower
        numTower = Math.ceil(totalNumFloors / 20);

        //Get average number of elevators per tower and rounding it up
        numAverElev = Math.ceil(numElev / numTower);

        //Multiypling rounded up number of elevators by number of tower
        finNumElev = numAverElev * numTower;
        console.log("server.js finNumElev lg102: " + finNumElev);

        //Apply formula depending on Product Range and getting total before install fees
        roughTotal = prodRange * finNumElev;

        console.log("server.js lg94: " + prodRange);

        //Calculate Installation Fees and get final total
        if (prodRange == 7565) {
            installFee = roughTotal * 0.1;
            total = roughTotal + installFee;
        } else if (prodRange == 12345) {
            installFee = roughTotal * 0.13;
            total = roughTotal + installFee;
        } else {
            installFee = roughTotal * 0.16;
            total = roughTotal + installFee;
        };

        setResult(finNumElev, roughTotal, installFee, total);

    };

    function doCalc() {

        if ($('#numApp').val() < 0) {

            alert("Please enter a positive number!");
            $('#numApp').val('');

        } else if ($('#numFloors').val() < 0) {

            alert("Please enter a positive number!");
            $('#numFloors').val('');

        } else if ($('#numBase').val() < 0) {

            alert("Please enter a positive number!");
            $('#numBase').val('');

        } else if ($('#numComp').val() < 0) {

            alert("Please enter a positive number!");
            $('#numComp').val('');

        } else if ($('#numPark').val() < 0) {

            alert("Please enter a positive number!");
            $('#numPark').val('');

        } else if ($('#numElev').val() < 0) {

            alert("Please enter a positive number!");
            $('#numElev').val('');

        } else if ($('#numCorpo').val() < 0) {

            alert("Please enter a positive number!");
            $('#numCorpo').val('');

        } else if ($('#maxOcc').val() < 0) {

            alert("Please enter a positive number!");
            $('#maxOcc').val('');

        } else {

            if ($('#residential').hasClass('active')) {
                if ($('#numApp').val() && $('#numFloors').val()) {

                    //Getting numbers from quote
                    GetInfos();

                    // numApp = getInfoNumApp();
                    // numFloors = getInfoNumFloors();

                    //Calculate number of elevators required
                    numElev = Math.ceil((numApp / numFloors) / 6);

                    //Multiplying for every 20 additional floors and setting final number of elevators required
                    finNumElev = parseFloat(numElev * Math.ceil(numFloors / 20));

                    setFirstResult(finNumElev);

                } else {
                    $('#numElev_2').val('');
                    $('#numElev_3').val('');
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };

                if ($('#numApp').val() && $('#numFloors').val() && ($('#standard').is(':checked') || $('#premium').is(':checked') || $('#excelium').is(':checked'))) {
                    CalcRes(numApp, numFloors, prodRange);

                } else {
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };
            };

            if ($('#commercial').hasClass('active')) {
                if ($('#numElev').val()) {
                    //Getting numbers from quote
                    // GetInfos();

                    numElev = getInfoNumElev();
                    prodRange = getProdRange();

                    // set numElev_2 et numElev_3
                    setFirstResult(numElev);
                } else {
                    $('#numElev_2').val('');
                    $('#numElev_3').val('');
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };

                if ($('#numElev').val() && ($('#standard').is(':checked') || $('#premium').is(':checked') || $('#excelium').is(':checked'))) {
                    numElev = getInfoNumElev();
                    prodRange = getProdRange();

                    CalcCom(numElev, prodRange);

                } else {
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };
            };

            if ($('#corporate').hasClass('active')) {
                if ($('#numFloors').val() && $('#numBase').val() && $('#maxOcc').val()) {

                    // GetInfos();

                    // numApp = getInfoNumApp();
                    numFloors = getInfoNumFloors();
                    numBase = getInfoNumBase();
                    maxOcc = getInfoMaxOcc();
                    prodRange = getProdRange();

                    // Add number of floors and basements
                    totalNumFloors = numFloors + numBase;

                    //Get required elevator tower
                    numTower = Math.ceil(totalNumFloors / 20);

                    //Get total occupancy
                    totalMaxOcc = maxOcc * totalNumFloors;

                    //Get required elevators
                    numElev = (totalMaxOcc / 1000);

                    //Get average number of elevators per tower and rounding it up
                    numAverElev = Math.ceil(numElev / numTower);

                    //Multiypling rounded up number of elevators by number of tower
                    finNumElev = numAverElev * numTower;

                    setFirstResult(finNumElev);
                } else {
                    $('#numElev_2').val('');
                    $('#numElev_3').val('');
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };

                if ($('#numFloors').val() && $('#numBase').val() && $('#maxOcc').val() && ($('#standard').is(':checked') || $('#premium').is(':checked') || $('#excelium').is(':checked'))) {
                    numFloors = getInfoNumFloors();
                    numBase = getInfoNumBase();
                    maxOcc = getInfoMaxOcc();
                    prodRange = getProdRange();

                    CalcCorpHyb(numFloors, numBase, maxOcc, prodRange);

                } else {
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };
            };

            if ($('#hybrid').hasClass('active')) {

                if ($('#numFloors').val() && $('#numBase').val() && $('#maxOcc').val()) {
                    // GetInfos();

                    // numApp = getInfoNumApp();
                    numFloors = getInfoNumFloors();
                    numBase = getInfoNumBase();
                    maxOcc = getInfoMaxOcc();
                    prodRange = getProdRange();

                    // Add number of floors and basements
                    totalNumFloors = numFloors + numBase;

                    //Get total occupancy
                    totalMaxOcc = maxOcc * totalNumFloors;

                    //Get required elevators
                    numElev = Math.ceil(totalMaxOcc / 1000);

                    //Get required elevator tower
                    numTower = Math.ceil(totalNumFloors / 20);

                    //Get average number of elevators per tower and rounding it up
                    numAverElev = Math.ceil(numElev / numTower);

                    //Multiypling rounded up number of elevators by number of tower
                    finNumElev = numAverElev * numTower;

                    // set numElev_2 et numElev_3
                    setFirstResult(finNumElev);
                } else {
                    $('#numElev_2').val('');
                    $('#numElev_3').val('');
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };

                if ($('#numFloors').val() && $('#numBase').val() && $('#maxOcc').val() && ($('#standard').is(':checked') || $('#premium').is(':checked') || $('#excelium').is(':checked'))) {

                    numFloors = getInfoNumFloors();
                    numBase = getInfoNumBase();
                    maxOcc = getInfoMaxOcc();
                    prodRange = getProdRange();

                    CalcCorpHyb(numFloors, numBase, maxOcc, prodRange);

                } else {
                    $('#elevTotal').val('');
                    $('#installation').val('');
                    $('#total_').val('');
                };
            };
        };
    };

});
