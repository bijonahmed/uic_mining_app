<!-- In your Blade view file -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Excel File</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    .table-bordered td,
    .table-bordered th {
        padding: 0.2rem; /* Adjust the padding value as needed */
    }
</style>
</head>
<body>

<!-- In your Blade view file -->
<div class="container">
<div class="container">
    <?php if(session('success')): ?>
        <div class="alert alert-success"><?php echo e(session('success')); ?></div>
    <?php endif; ?>

    <?php if(session('error')): ?>
        <div class="alert alert-danger"><?php echo e(session('error')); ?></div>
    <?php endif; ?>
    <!-- Your upload form here -->
</div>
    <h2>Upload Excel File</h2>
    <form action="<?php echo e(url('submit')); ?>" method="POST" enctype="multipart/form-data">
        <?php echo csrf_field(); ?>
        <div class="form-group">
            <label for="file">Choose Excel File:</label>
            <input type="file" class="form-control-file" id="file" name="file" required>
        </div>
        <button type="submit" class="btn btn-primary">Upload</button>

    </form>

    <hr/>
    <div algin><a href="<?php echo e(url('/upload')); ?>">Refreesh</a></div>
    <table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
        </tr>
    </thead>
    <tbody>
        <?php $__currentLoopData = $uploads; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $upload): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr>
                <td><?php echo e($upload->name); ?></td>
                <td><?php echo e($upload->email); ?></td>
                <td><?php echo e($upload->password); ?></td>
            </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </tbody>
</table>

<!-- Pagination Links -->
<div class="row">
    <div class="col-md-6">
        <p>Total Rows: <?php echo e($uploads->total()); ?></p>
    </div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-end">
                
                <?php if($uploads->onFirstPage()): ?>
                    <li class="page-item disabled"><span class="page-link">Previous</span></li>
                <?php else: ?>
                    <li class="page-item"><a class="page-link" href="<?php echo e($uploads->previousPageUrl()); ?>">Previous</a></li>
                <?php endif; ?>

                
                <?php for($i = max(1, $uploads->currentPage() - 2); $i <= min($uploads->lastPage(), $uploads->currentPage() + 2); $i++): ?>
                    <li class="page-item <?php echo e($i === $uploads->currentPage() ? 'active' : ''); ?>">
                        <a class="page-link" href="<?php echo e($uploads->url($i)); ?>"><?php echo e($i); ?></a>
                    </li>
                <?php endfor; ?>

                
                <?php if($uploads->hasMorePages()): ?>
                    <li class="page-item"><a class="page-link" href="<?php echo e($uploads->nextPageUrl()); ?>">Next</a></li>
                <?php else: ?>
                    <li class="page-item disabled"><span class="page-link">Next</span></li>
                <?php endif; ?>
            </ul>
        </nav>
    </div>
</div>



</div>



</body>
</html>
<?php /**PATH F:\Server\htdocs\uic_mining_app\api\resources\views/upload.blade.php ENDPATH**/ ?>