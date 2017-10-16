<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="#" data-toggle="tooltip" title="<?php echo $lang_save_and_stay; ?>" class="btn btn-success" onclick="$('#form-iscroller').submit();return false;"><i class="fa fa-save"></i></a>
                <a href="#" data-toggle="tooltip" title="<?php echo $lang_save_and_close; ?>" class="btn btn-primary" onclick="$('#form-iscroller [name=action]').val('save');$('#form-iscroller').submit();return false;"><i class="fa fa-save"></i></a>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
        
            <h1><?php echo $lang_heading_title_adv; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
       <?php if ($error_warning) { ?>

    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>

      <button type="button" class="close" data-dismiss="alert">&times;</button>

    </div>

    <?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $lang_text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-iscroller" class="form-horizontal">
                    <input type="hidden" name="action" value="apply" />
                    
                    <div class="tab-content">
                       
                            <div class="form-group">
                                <label class="control-label col-sm-4 col-md-3"><?php echo $lang_enable_infinite_scroll; ?></label>
                                <div class="col-sm-8 col-md-9">
                                    <label><input type="radio" name="iscroller_module[infScroll][enabled]" value="1" /> <?php echo $text_yes; ?></label>
                                    <label><input type="radio" name="iscroller_module[infScroll][enabled]" value="0" /> <?php echo $text_no; ?></label>
                                </div>
                            </div>
                           
                           
                            <div class="form-group">
                                <label for="container-selector" class="control-label col-sm-4 col-md-3"><?php echo $lang_container_selector; ?></label>
                                <div class="col-sm-8 col-md-9">
                                    <input type="text" name="iscroller_module[infScroll][containerSelector]" value="" id="container-selector" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="paginator-selector" class="control-label col-sm-4 col-md-3"><?php echo $lang_paginator_selector; ?></label>
                                <div class="col-sm-8 col-md-9">
                                    <input type="text" name="iscroller_module[infScroll][paginatorSelector]" value="" id="paginator-selector" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="item-selector" class="control-label col-sm-4 col-md-3"><?php echo $lang_item_selector; ?></label>
                                <div class="col-sm-8 col-md-9">
                                    <input type="text" name="iscroller_module[infScroll][itemSelector]" value="" id="item-selector" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="min-dist-to-bottom" class="control-label col-sm-4 col-md-3"><?php echo $lang_min_dist_to_bottom; ?></label>
                                <div class="col-sm-8 col-md-9">
                                    <input type="text" name="iscroller_module[infScroll][minDistToBottom]" value="" id="min-dist-to-bottom" class="form-control" />
                                </div>
                            </div>

                            <ul class="nav nav-tabs col-sm-8 col-md-9 col-sm-offset-4 col-md-offset-3" id="language">
                                <?php $i = 0; foreach ($languages as $language) { $i++; ?>
                                    <li<?php if ($i===1) { ?> class="active"<?php } ?>><a href="#loading-msg-lang-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                            <div class="tab-content">
                            <?php $i = 0; foreach ($languages as $language) { $i++; ?>
                                <div class="tab-pane<?php if ($i===1) { ?> active<?php } ?>" id="loading-msg-lang-<?php echo $language['language_id']; ?>">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4 col-md-3"><?php echo $lang_loading_msg; ?></label>
                                        <div class="col-sm-8 col-md-9">
                                            <input type="text" class="form-control" name="iscroller_module[infScroll][loadingMsg][<?php echo $language['code']; ?>]" value="<?php echo $lang_loading_def_msg; ?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4 col-md-3"><?php echo $lang_finish_msg; ?></label>
                                        <div class="col-sm-8 col-md-9">
                                            <input type="text" class="form-control" name="iscroller_module[infScroll][finishMsg][<?php echo $language['code']; ?>]" value="<?php echo $lang_finish_def_msg; ?>" />
                                        </div>
                                    </div>
                                   
                                </div>
                            <?php } ?>
                            </div>
                       
                      
                    </div>
                    <input type="hidden" name="iscroller_module[infScroll][loadingMode]" value="auto">
                </form>
            </div>
        </div>
    </div>
</div>
<script>
(function($){
    var convertToFormNames = function(obj) {
        var out = {};
        if (typeof obj === 'object' || typeof obj === 'array') {
            for (var k in obj) {
                var arr = convertToFormNames(obj[k]);
                for (var k2 in arr) {
                    out['['+k+']'+k2] = arr[k2];
                }
            }
        } else {
            out[''] = obj;
        }
        return out;
    };
    var fillForm = function(form, settingsObj) {
        var settings = convertToFormNames(settingsObj);
        for (var name in settings) {
            var field = form.find('[name="iscroller_module'+name+'"]');
            if (field.size()) {
                var type = field.eq(0).attr('type') ? field.eq(0).attr('type').toLowerCase() : '';
                var tag  = field.eq(0).prop('tagName').toLowerCase();
                if (type === 'text' || tag === 'select') {
                    field.val(settings[name]);
                } else if (type === 'radio' || type === 'checkbox') {
                    field.filter('[value="'+settings[name]+'"]').attr('checked', 'checked');
                }
            }
        }
    };
    
    fillForm($('#form-iscroller'), <?php echo json_encode($settings); ?>);
    
   
})(jQuery);
</script>
<?php echo $footer;