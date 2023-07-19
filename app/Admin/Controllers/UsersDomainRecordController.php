<?php

namespace App\Admin\Controllers;

use App\Models\UsersDomainsRecord;
use Nicelizhi\Admin\Controllers\AdminController;
use Nicelizhi\Admin\Form;
use Nicelizhi\Admin\Grid;
use Nicelizhi\Admin\Show;

class UsersDomainRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'UsersDomainsRecord';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UsersDomainsRecord());

        $grid->column('id', __('Id'));
        $grid->column('domain_id', __('Domain id'))->filter();
        $grid->column('type', __('Type'));
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
        $show = new Show(UsersDomainsRecord::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('domain_id', __('Domain id'));
        $show->field('type', __('Type'));
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
        $form = new Form(new UsersDomainsRecord());

        $form->number('domain_id', __('Domain id'));
        $form->text('type', __('Type'));

        return $form;
    }
}
