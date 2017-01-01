<?php

require_once("../inc/util.inc");

$user = get_logged_in_user();
$host_id = get_int('host_id');
$host = BoincHost::lookup_id($host_id);
if ($host->userid != $user->id) {
    error_page("not your host");
}
page_head("Computer details");
show_host_detail($host);
page_tail();
?>