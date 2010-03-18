module RailsUploadProgressHelper
  def upload_progress_id_key
    "X-Progress-ID"
  end
  
  def upload_progress_uuid
    chars = ['A'..'Z', 'a'..'z', '0'..'9'].map{|r|r.to_a}.flatten
    @upload_progress_uuid ||= Array.new(32).map{chars[rand(chars.size)]}.join
  end
  
  def upload_progress_bar
    %Q{
      <script type="text/javascript" charset="utf-8">
        var UploadProgress = Class.create({
          initialize: function(uuid) {
            this.uuid = uuid;
            this.interval = null;

            var frame = document.createElement("iframe");
            frame.id = frame.name = "upload_progress_frame";
            frame.style.display = "none";
            frame.src = "about:blank";
            document.body.appendChild(frame);

            var script_prototype = upload_progress_frame.document.createElement("script");
            script_prototype.src = "/javascripts/prototype.js";
            upload_progress_frame.document.body.appendChild(script_prototype);
          },
          open: function() {
            var my_object = this;
            this.interval = window.setInterval(function() {my_object.fetch()}, 1000);
            return true;
          },
          fetch: function() {
            var current_interval = this.interval;
            new upload_progress_frame.Ajax.Request('/progress_upload?X-Progress-ID=' + this.uuid, {
              asynchronous:true,
              evalScripts:true,
              method:'get',
              evalJSON:'force',
              onComplete: function(transport) {
                var response = transport.responseJSON;
                if (response.state == "uploading") {
                  var percentage = parseInt(response.received*100/response.size);

                  $("upload_progress_color").style.width = percentage + "%";
                  $("upload_progress_percentage").innerHTML = percentage + "%";
                }
                if (response.state == "done" || (response.state == "uploading" && response.received == response.size)) {
                  window.clearInterval(current_interval);
                }
              }
            });
          }
        });

        my_upload_progress = new UploadProgress('#{upload_progress_uuid}');
      </script>
      
      <style type="text/css" media="screen">
        #upload_progress_bar {
          width: 200px;
          height: 20px;
          border: 1px solid #999;
        }
        #upload_progress_color {
          height: 20px;
          width: 0%;
          background-color: green;
        }
      </style>

      <div id="upload_progress_bar">
        <div id="upload_progress_color"></div>
      </div>
      <span id="upload_progress_percentage">0%</span>
    }
  end
end
