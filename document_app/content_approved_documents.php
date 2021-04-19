<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap 4 Grid Layouts for Large Devices</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- <style>
    /* Some custom styles to beautify this example */
    p {
        padding: 50px;
        font-size: 64px;
        font-weight: bold;
        text-align: center;
        background: #dbdfe5;
    }
    </style> -->

</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <?php include 'includes/navbar.php'; ?>
        <?php include 'includes/menubar.php'; ?>
        <?php include 'includes/functions.php'; ?>

        <div class="content-wrapper">

            <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Approved Documents</li>
                </ol>
                <h1>
                    Approved Documents
                </h1>
            </div>

            <div class="container">
                <div class="card-deck">

                    <!-- CARD 1 -->

                    <div class="card text-center shadow">
                        <div class="card-header">
                            <h3>Free</h3>
                            <h5>£0!</h5>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title">For individuals</h5>
                            <p class="card-text">Great for personal projects</p>
                        </div>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Feature 1</li>
                            <li class="list-group-item">Feature 2</li>
                            <li class="list-group-item">Feature 3</li>
                        </ul>

                        <div class="card-footer">
                            <a href="#" class="btn btn-info">Create Account</a>
                        </div>
                    </div>

                    <!-- CARD 2 -->

                    <div class="card text-center shadow border-success">
                        <div class="card-header text-white bg-success">
                            <h3>Standard</h3>
                            <h5>£20</h5>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title">For small teams</h5>
                            <p class="card-text">Great for teams of 2 - 10</p>
                        </div>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item border-success">All free features</li>
                            <li class="list-group-item border-success">Feature 4</li>
                            <li class="list-group-item border-success">Feature 5</li>
                        </ul>

                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Create Account</a>
                        </div>
                    </div>

                    <!-- CARD 3 -->

                    <div class="card text-center shadow">

                        <div class="card-header">
                            <h3>Premium</h3>
                            <h5>£30</h5>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title">For larger teams</h5>
                            <p class="card-text">Great for teams of 11 or more</p>
                        </div>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">All standard features</li>
                            <li class="list-group-item">Feature 6</li>
                            <li class="list-group-item">Feature 7</li>
                        </ul>

                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Create Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>