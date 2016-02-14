$(function() {
    return $('#target').fileupload({
        dataType: "json",
        formData: function(form){
            var sessionData = [{uuid: $('#session_uuid').val() }];
            return form.serializeArray();
        },
        add: function(e, data) {
            var file, types;
            file = data.files[0];
            data.context = $(tmpl("template-upload", file));
            $('#target').append(data.context);
            return data.submit();
        },
        progress: function(e, data) {
            console.log('running in the progress');
            var progress;
            if (data.context) {
                progress = parseInt(data.loaded / data.total * 100, 10);
                console.log(progress);
                return data.context.find('.bar').css('width', progress + '%');
            }
        },
        done: function(e, data){
            $.each(data.files, function (index, file) {
                console.log('done');
            });

            console.log(data.result.files);
        }
    });
});
