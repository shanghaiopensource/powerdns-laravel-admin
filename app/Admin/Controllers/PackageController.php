<?php

namespace App\Admin\Controllers;

use App\Models\Package;
use Nicelizhi\Admin\Controllers\AdminController;
use Nicelizhi\Admin\Form;
use Nicelizhi\Admin\Grid;
use Nicelizhi\Admin\Show;

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
        $form->decimal('price', __('Price'));
        $form->text('status', __('Status'));
        $form->text('owner', __('Owner'));
        $form->text('rules', __('Rules'));

        return $form;
    }
}
