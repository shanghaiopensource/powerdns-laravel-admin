<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <?php foreach($packages as $key=>$package) { ?>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?php echo $package->title;?></h3>

              <p><?php echo $package->description;?></p>

              <p>$<?php echo $package->price;?></p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="./buy/<?php echo $package->id;?>" class="small-box-footer btn"> <?php echo __('Buy');?> <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <?php } ?>
      </div>
      <!-- /.row -->
</section>