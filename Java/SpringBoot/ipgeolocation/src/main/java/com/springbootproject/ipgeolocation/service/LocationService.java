package com.springbootproject.ipgeolocation.service;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class LocationService {
    
    public static JSONObject getJson(URL url) throws IOException {
        String json = IOUtils.toString(url, Charset.forName("UTF-8"));
        return new JSONObject(json);
    }

    public static JSONObject GetIp() throws IOException {
        URL url = new URL("https://api.ipify.org/?format=json");
        JSONObject jsonObject = getJson(url);
        
        return jsonObject;
    }

    public static JSONObject GetIpInfo() throws IOException {
        URL url = new URL("https://ipinfo.io/" + GetIp().getString("ip") + "/geo");
        JSONObject jsonObject = getJson(url);
        return jsonObject;
    }

    public static JSONObject GenerateUrl() throws IOException {
        String[] loc = GetIpInfo().getString("loc").split(",");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("url","https://www.openstreetmap.org/?mlat="+loc[0]+"&mlon="+loc[1]+"#map=18/"+loc[0]+"/"+loc[1]+"&layers=N");
        return jsonObject;        
    }

    public static JSONObject GenerateUrlEmbed() throws IOException {
        String[] loc = GetIpInfo().getString("loc").split(",");
        Double lat = Double.parseDouble(loc[0]);
        Double lon = Double.parseDouble(loc[1]);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("url_embed","https://www.openstreetmap.org/export/embed.html?bbox="+(lon-0.05)+"%2C"+(lat-0.05)+"%2C"+(lon+0.05)+"%2C"+(lat+0.05)+"&amp;layer=mapnik");
        return jsonObject;        
    }

}
