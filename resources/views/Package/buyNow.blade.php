<div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">创建订单</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <form class="form"  method="post">
        {{ csrf_field() }}
        <div class="box-body">
                <div class="row">
                        <div class="col-md-6">
                        
                            <div class="form-group">
                                <label>域名</label>
                                <select class="form-control select2" name="domains" style="width: 100%;">
                                    <?php foreach($domains as $key=>$domain) { ?>
                                    <option selected="selected" value="<?php echo $domain->id;?>"><?php echo $domain->domain;?></option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="price">价格</label>
                                <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                <input type="text" class="form-control" id="price" placeholder="价格" readonly="true" value="<?php echo $package->price;?>">
                            </div>

                            <div class="form-group">
                                <label for="counpon_code">优惠券</label>
                                <input type="text" class="form-control" id="counpon_code" placeholder="优惠券">
                            </div>

                            <input type="hidden" name="package_id" value="<?php echo $package_id;?>" />

                            <div class="box-footer">
                                <button type="submit" class="btn btn-info pull-right">提交</button>
                            </div>
                        </div>
                        
                    </div>
        </div>
        </form>
</div>