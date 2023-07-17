<?php

namespace App\Admin\Controllers;

use App\Models\UsersDomain;
use Nicelizhi\Admin\Controllers\AdminController;
use Nicelizhi\Admin\Form;
use Nicelizhi\Admin\Grid;
use Nicelizhi\Admin\Show;
use Nicelizhi\Admin\Facades\Admin;
use Exonet\Powerdns\Powerdns;
use Exonet\Powerdns\RecordType;

class UserDomainController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Domain';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UsersDomain());

        $grid->column('id', __('Id'));
        $grid->column('domain', __('Domain'));
        $grid->column('user_id', __('User id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));



        //Admin::user()->isAdministrator();
        if(!Admin::user()->isAdministrator()){

            $grid->model()->where("user_id", Admin::user()->id);
        }

        $grid->model()->orderBy("id", "desc");

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
        $show = new Show(UsersDomain::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('domain', __('Domain'));
        $show->field('user_id', __('User id'));
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
        $form = new Form(new UsersDomain());

        $form->text('domain', __('Domain'))->creationRules(['required',"unique:users_domains"])->updateRules(['required', "unique:users_domains,domain,{{id}}"]);
        $form->hidden('user_id', __('User id'))->default(Admin::user()->id);

        // 子表字段
        $form->hasMany('records', function (Form\NestedForm $form) {
            $form->text("name");
            $form->text('type');
            $form->text("value");
            $form->text("ttl")->default(3600);
        });

        $form->saving(function ($form) {
            //检查用户使用有资格创建域名信息
            
        });

        //保存后回调
        $form->saved(function ($form) {

            $url = config("pdns.api_url");
            $key = config("pdns.api_key");
            $powerdns = new Powerdns($url, $key);

            // Create a new zone.
            $zone = $powerdns->createZone(
                $form->model()->domain,
                ['ns1.zylinkus.com.', 'ns2.zylinkus.com.']
            );

        });

        return $form;
    }
}
