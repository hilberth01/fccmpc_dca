<?php include 'includes/slugify.php'; ?>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php include 'includes/navbar.php'; ?>
    <?php include 'includes/menubar.php'; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Dashboard
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Dashboard</li>
        </ol>
      </section>

      <!-- Main content -->
      <section class="content">
        <?php
        if (isset($_SESSION['error'])) {
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              " . $_SESSION['error'] . "
            </div>
          ";
          unset($_SESSION['error']);
        }
        if (isset($_SESSION['success'])) {
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i> Success!</h4>
              " . $_SESSION['success'] . "
            </div>
          ";
          unset($_SESSION['success']);
        }
        ?>
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
              <div class="inner">
                <?php
                $sql = "SELECT * FROM fs_request_main";
                $query = $conn->query($sql);

                echo "<h3>" . $query->num_rows . "</h3>";
                ?>

                <p>No. of Documents</p>
              </div>
              <div class="icon">
                <i class="fa fa-tasks"></i>
              </div>
              <a href="main.php?pid=request&status=All Documents" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <!-- COMPLETED DOCS -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
              <div class="inner">
          
                <?php
                $sql = "SELECT * FROM fs_request_main WHERE rq_status='Completed'";
                $query = $conn->query($sql);

                echo "<h3>" . $query->num_rows . "</h3>";
                ?>

                <p>No. of Completed Doc</p>
          
              </div>
              <div class="icon">
                <i class="fa fa-black-tie"></i>
              </div>
              <a href="main.php?pid=request&status=Completed" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

<!-- Pending Docs -->
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
              <div class="inner">
                <?php
                $sql = "SELECT * FROM fs_request_main WHERE rq_status <> 'Completed' and rq_status <> 'Cancelled' and rq_status <> 'New'";
                $query = $conn->query($sql);

                echo "<h3>" . $query->num_rows . "</h3>";
                ?>

                <p>No. of Pending Doc</p>
              </div>
              <div class="icon">
                <i class="fa fa-users"></i>
              </div>
              <a href="main.php?pid=request&status=Approved" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
              <div class="inner">
                <?php
                $sql = "SELECT * FROM fs_request_main WHERE rq_status = 'Cancelled'";
                $query = $conn->query($sql);

                echo "<h3>" . $query->num_rows . "</h3>";
                ?>

                <p>No. of Cancelled Doc</p>
              </div>
              <div class="icon">
                <i class="fa fa-edit"></i>
              </div>
              <a href="main.php?pid=request&status=Cancelled" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>

        <div class="row">
          <div class="col-xs-12">
            <h3>Number of Appoved Task per Request
              <span class="pull-right">
                <!-- <a href="print.php" class="btn btn-success btn-sm btn-flat"><span class="glyphicon glyphicon-print"></span> Print</a> -->
              </span>
            </h3>
          </div>
        </div>

        <?php
        $sql = "SELECT form_id, form_name FROM fs_workflow GROUP BY form_name ORDER BY form_name ASC";
        $query = $conn->query($sql);
        $inc = 2;
        while ($row = $query->fetch_assoc()) {
          $inc = ($inc == 2) ? 1 : $inc + 1;
          if ($inc == 1) echo "<div class='row'>";
          echo "
            <div class='col-sm-6'>
              <div class='box box-solid'>
                <div class='box-header with-border'>
                  <h4 class='box-title'><b>" . $row['form_name'] . "</b></h4>
                </div>
                <div class='box-body'>
                  <div class='chart'>
                    <canvas id='" . slugify($row['form_id']) . "' style='height:200px'></canvas>
                  </div>
                </div>
              </div>
            </div>
          ";
          if ($inc == 2) echo "</div>";
        }
        if ($inc == 1) echo "<div class='col-sm-6'></div></div>";
        ?>

      </section>
      <!-- right col -->
    </div>
    <?php include 'includes/footer.php'; ?>

  </div>
  <!-- ./wrapper -->

  <?php include 'includes/scripts.php'; ?>
  <?php
  $sql = "SELECT form_id, form_name FROM fs_workflow GROUP BY form_name ORDER BY form_name ASC";
  $query = $conn->query($sql);
  while ($row = $query->fetch_assoc()) {
    $sql = "SELECT * FROM fs_request_main WHERE rq_workflow = '" . $row['form_id'] . "' and rq_status != 'Completed'";
    $cquery = $conn->query($sql);
    $carray = array();
    $varray = array();
    while ($crow = $cquery->fetch_assoc()) {
      array_push($carray, $crow['rq_name']);
      $sql = "SELECT * FROM fs_request_approval WHERE request_id = '" . $crow['rq_id'] . "' and user_apex in ('Approved','Confirmed')";
      $vquery = $conn->query($sql);
      array_push($varray, $vquery->num_rows);
    }
    $carray = json_encode($carray);
    $varray = json_encode($varray);
  ?>
    <script>
      $(function() {
        var rowid = '<?php echo $row['form_id']; ?>';
        var description = '<?php echo slugify($row['form_id']); ?>';
        var barChartCanvas = $('#' + description).get(0).getContext('2d')
        var barChart = new Chart(barChartCanvas)
        var barChartData = {
          labels: <?php echo $carray; ?>,
          datasets: [{
            label: 'Records',
            fillColor: 'rgba(60,141,188,0.9)',
            strokeColor: 'rgba(60,141,188,0.8)',
            pointColor: '#3b8bba',
            pointStrokeColor: 'rgba(60,141,188,1)',
            pointHighlightFill: '#fff',
            pointHighlightStroke: 'rgba(60,141,188,1)',
            data: <?php echo $varray; ?>
          }]
        }
        var barChartOptions = {
          //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
          scaleBeginAtZero: true,
          //Boolean - Whether grid lines are shown across the chart
          scaleShowGridLines: true,
          //String - Colour of the grid lines
          scaleGridLineColor: 'rgba(0,0,0,.05)',
          //Number - Width of the grid lines
          scaleGridLineWidth: 1,
          //Boolean - Whether to show horizontal lines (except X axis)
          scaleShowHorizontalLines: true,
          //Boolean - Whether to show vertical lines (except Y axis)
          scaleShowVerticalLines: true,
          //Boolean - If there is a stroke on each bar
          barShowStroke: true,
          //Number - Pixel width of the bar stroke
          barStrokeWidth: 2,
          //Number - Spacing between each of the X value sets
          barValueSpacing: 5,
          //Number - Spacing between data sets within X values
          barDatasetSpacing: 1,
          //String - A legend template
          legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
          //Boolean - whether to make the chart responsive
          responsive: true,
          maintainAspectRatio: true
        }

        barChartOptions.datasetFill = false
        var myChart = barChart.HorizontalBar(barChartData, barChartOptions)
        //document.getElementById('legend_'+rowid).innerHTML = myChart.generateLegend();
      });
    </script>
  <?php
  }
  ?>
</body>

</html>