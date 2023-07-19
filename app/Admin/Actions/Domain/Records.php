<?php

namespace App\Admin\Actions\Domain;

use Illuminate\Database\Eloquent\Model;
use Nicelizhi\Admin\Actions\RowAction;

class Records extends RowAction
{
    public $name = 'Domain Records';

    /*
    public function handle(Model $model)
    {
        // $model ...

        return $this->response()->success('Success message.')->refresh();
    }
    */

    public function href()
    {
        return "/admin/users-domains-records/?domain_id=".$this->getKey();
    }

}