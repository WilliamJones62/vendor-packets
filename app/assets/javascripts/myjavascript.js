  $(document).ready(function() {

    function getData(data)
    {
      var p1 = data.replace('[', "");
      var p2 = p1.replace(']', "");
      p1 = p2.replace(/,/g, "");
      var data_array = p1.split(" ");
      data_array.shift();
      data_array.pop();
      return data_array;
    }

    function pieChart()
      {
      //******* Month to date late order pie chart
      var percentages = document.getElementById("percentages").innerHTML;
      var percent_array = getData(percentages);
      var labels = ["0%", "1-20%", "21-40%", "41-60%", "61-80%", "81-100%"]
      var dataset = [];
      var length = percent_array.length;
      var i = 0;
      for (i = 0; i < length; i++) {
        dataset[i] = {
          label: labels[i],
          data: percent_array[i]
        }
      }

      var options = {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
          clickable: true,
          hoverable: true
        }
      }
      $.plot($("#flot-piechart"), dataset, options);
    }

    function showToolTip(contents) {
      $('<div id="tooltip">' + contents + '</div>').css( {
        position: 'relative', display: 'none'
      }).appendTo('#mypie').fadeIn(200);
    }

    function showSliceOfPie(ven_code, ven_name, pcent, packet_id) {
      var mypie = document.getElementById('pietable');
      var tit = document.createElement('h3');
      tit.setAttribute("id","pieface");
      var h3Text = document.createTextNode("Vendors completing " + pcent + " of their packet");
      tit.appendChild(h3Text);
      var tbl = document.createElement('table');
      tbl.setAttribute("id","sliceofpie");
      tbl.setAttribute("class","mytable");
      var row = document.createElement('tr');
      var headerCell = document.createElement("th");
      var cellText = document.createTextNode('Vendor number');
      headerCell.appendChild(cellText);
      row.appendChild(headerCell);
      var headerCell = document.createElement("th");
      var cellText = document.createTextNode('Name');
      headerCell.appendChild(cellText);
      row.appendChild(headerCell);
      var headerCell = document.createElement("th");
      var cellText = document.createTextNode('Show Packet');
      headerCell.appendChild(cellText);
      row.appendChild(headerCell);
      tbl.appendChild(row);
      var length = ven_name.length
      //Add the data rows.
      for (var i = 0; i < length; i++) {
        var row = document.createElement("tr");
        var cell = document.createElement("td");
        var cellText = document.createTextNode(ven_code[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        var cell = document.createElement("td");
        company_name = ven_name[i].replace(/"/g, '')
        var cellText = document.createTextNode(company_name.replace(/~/g, ' '));
        cell.appendChild(cellText);
        row.appendChild(cell);
        var cell = document.createElement("td");
        var a = document.createElement('a');
        var linkText = document.createTextNode("Show");
        a.appendChild(linkText);
        a.title = "Show vendor packet";
        a.href = "/packets/" + packet_id[i];
        cell.appendChild(a);
        row.appendChild(cell);
        tbl.appendChild(row);
      }
      mypie.appendChild(tit);
      mypie.appendChild(tbl);
    }

    $("#flot-piechart").bind("plotclick", function (event, pos, item) {
      $('#pieface').remove();
      $('#sliceofpie').remove();
      if (item) {
        switch (item.series.label) {
          case '0%':
            var pie_code = document.getElementById("percent0code").innerHTML;
            var pie_name = document.getElementById("percent0name").innerHTML;
            var packets = document.getElementById("percent0packet").innerHTML;
            break;
          case '1-20%':
            var pie_code = document.getElementById("percent20code").innerHTML;
            var pie_name = document.getElementById("percent20name").innerHTML;
            var packets = document.getElementById("percent20packet").innerHTML;
            break;
          case '21-40%':
            var pie_code = document.getElementById("percent40code").innerHTML;
            var pie_name = document.getElementById("percent40name").innerHTML;
            var packets = document.getElementById("percent40packet").innerHTML;
            break;
          case '41-60%':
            var pie_code = document.getElementById("percent60code").innerHTML;
            var pie_name = document.getElementById("percent60name").innerHTML;
            var packets = document.getElementById("percent80packet").innerHTML;
            break;
          case '61-80%':
            var pie_code = document.getElementById("percent80code").innerHTML;
            var pie_name = document.getElementById("percent80name").innerHTML;
            var packets = document.getElementById("percent80packet").innerHTML;
            break;
          default:
            var pie_code = document.getElementById("percent100code").innerHTML;
            var pie_name = document.getElementById("percent100name").innerHTML;
            var packets = document.getElementById("percent100packet").innerHTML;
        }
      }
      var ven_code = getData(pie_code);
      var ven_name = getData(pie_name);
      var packet_id = getData(packets);
      showSliceOfPie(ven_code, ven_name, item.series.label, packet_id);
    });

    $("#flot-piechart").bind("plothover", function (event, pos, item) {
      $('#tooltip').remove();
      if (item) {
        switch (item.series.label) {
          case '0%':
            var pie_code = document.getElementById("percent0code").innerHTML;
            break;
          case '1-20%':
            var pie_code = document.getElementById("percent20code").innerHTML;
            break;
          case '21-40%':
            var pie_code = document.getElementById("percent40code").innerHTML;
            break;
          case '41-60%':
            var pie_code = document.getElementById("percent60code").innerHTML;
            break;
          case '61-80%':
            var pie_code = document.getElementById("percent80code").innerHTML;
            break;
          default:
            var pie_code = document.getElementById("percent100code").innerHTML;
        }
        var ven_code = getData(pie_code);
        showToolTip(ven_code.length + " vendors have completed " + item.series.label + " of their packet.");
      }
    });

    $('.mytable').DataTable({
      scrollY: "400px",
      scrollCollapse: true,
      paging: false,
      autoWidth: true,
      responsive: true,
      retrieve: true,
      buttons: [
        'print'
      ]
    });
    $("#fadetoggle1").change(function(){
        $("#usda2").toggle(1000);
    });
    $("#fadetoggle2").change(function(){
        $("#usda3").toggle(1000);
    });
    $("#btnPrint").printPreview({
      obj2print:'#main'
    });

    pieChart();

  });
