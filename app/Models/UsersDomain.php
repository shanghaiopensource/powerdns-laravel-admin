<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UsersDomain extends Model
{
    use HasFactory;

    public function records() {
        return $this->hasMany(UsersDomainsRecord::class, "domain_id", "id");
    }
}
