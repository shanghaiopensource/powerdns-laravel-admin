<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Nicelizhi\Admin\Controllers\Dashboard;
use Nicelizhi\Admin\Layout\Column;
use Nicelizhi\Admin\Layout\Content;
use Nicelizhi\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('Dashboard')
            ->description('Description...')
            ->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::environment());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
    }
}
