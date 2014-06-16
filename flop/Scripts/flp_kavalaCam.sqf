
flpcam = "camera" camcreate [0,0,0];
flpcam cameraeffect ["internal", "back"] ;

flpcam camsettarget getMarkerPos "kavalacam";
flpcam camsetrelpos [0,-45,20];
flpcam camcommit 0 ;

titlecut [" ","BLACK IN",2];

flp_cam = "1";

while {flp_cam == "1"} do {
    flpcam camsetrelpos [-45,0,20];
flpcam camcommit 30;
camcommitted flpcam;

sleep 30;

flpcam camsetrelpos [0,45,30];
flpcam camcommit 30;
camcommitted flpcam;

sleep 30;

flpcam camsetrelpos [45,0,30];
flpcam camcommit 30;
camcommitted flpcam;

sleep 30;

flpcam camsetrelpos [0,-45,30];
flpcam camcommit 30;
camcommitted flpcam;

sleep 30;
};


titlecut [" ","BLACK OUT",2];

flpcam cameraeffect ["terminate", "back"];
camdestroy flpcam;

titlecut [" ","BLACK IN",2];
