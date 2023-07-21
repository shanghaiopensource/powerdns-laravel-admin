<?php

namespace App\Admin\Controllers;

use App\Models\Package;
use Nicelizhi\Admin\Controllers\AdminController;
use Nicelizhi\Admin\Form;
use Nicelizhi\Admin\Grid;
use Nicelizhi\Admin\Show;
use Nicelizhi\Admin\Layout\Content;
use Illuminate\Http\Request;
use Nicelizhi\Admin\Facades\Admin;

class PackageController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Package';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Package());

        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
        $grid->column('description', __('Description'));
        $grid->column('start_at', __('Start at'));
        $grid->column('end_at', __('End at'));
        $grid->column('price', __('Price'));
        $grid->column('status', __('Status'));
        $grid->column('owner', __('Owner'));
        $grid->column('rules', __('Rules'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Package::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('description', __('Description'));
        $show->field('start_at', __('Start at'));
        $show->field('end_at', __('End at'));
        $show->field('price', __('Price'));
        $show->field('status', __('Status'));
        $show->field('owner', __('Owner'));
        $show->field('rules', __('Rules'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Package());

        $form->text('title', __('Title'));
        $form->text('description', __('Description'));
        $form->date('start_at', __('Start at'))->default(date('Y-m-d'));
        $form->date('end_at', __('End at'))->default(date('Y-m-d'));
        $form->currency('price', __('Price'))->symbol('$');
        $form->text('status', __('Status'));
        $form->text('owner', __('Owner'));
        $form->text('rules', __('Rules'));

        return $form;
    }

    public function buy(Content $content,Request $request) {
        $packages = Package::get();
        //var_dump($packages);
        return $content->view("Package/buy", compact("packages"));
    }

    public function BuyNow($package_id, Content $content,Request $request) {
        $package = Package::where("id", $package_id)->first();
        $domains = \App\Models\UsersDomain::where("user_id", Admin::user()->id)->get();
        if($request->isMethod('post')) {
            $domain = $request->input("domain");
            $coupon_code = $request->input("coupon_code");

            //验证优惠券是否有效
            if(!empty($coupon_code)) {
                $coupon = \App\Models\CounponCode::where("code", $coupon_code)->first();
                if(is_null($coupon)) {
                    
                }
            }
            //验证域名是否有用
        }
        return $content->view("Package/buyNow", compact("package","domains", "package_id"));
    }
}
