package send;

import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.AppMessage;
import com.gexin.rp.sdk.exceptions.RequestException;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.NotificationTemplate;
import com.gexin.rp.sdk.template.TransmissionTemplate;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.base.IAliasResult;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class AppPush {

    //定义常量, appId、appKey、masterSecret 采用本文档 "第二步 获取访问凭证 "中获得的应用配置
    private static String appId = "H15S7YlakT6ydg6Xlpnxg1";
    private static String appKey = "g8Zb3xdIq16HoCm9veX8U6";
    private static String masterSecret = "Yc3hG8PEbt6UyWeBRh1mxA";
    private static String url = "http://sdk.open.api.igexin.com/apiex.htm";
    private static String host = "http://sdk.open.api.igexin.com/apiex.htm";
    private static String cid = "3426c0d99d664cf87b3245134c244e14";
    static String Alias = "T0001283";

    public static void main(String[] args) throws IOException {
    }



    public static String getUserAlias(String cid) {
        IGtPush push = new IGtPush(host, appKey, masterSecret);
        IAliasResult queryAlias = push.queryAlias(appId, cid);
        String alias = queryAlias.getAlias();
        return alias;

    }

    public static String getUserTags(String cid) {
        IGtPush push = new IGtPush(host, appKey, masterSecret);
        IPushResult result = push.getUserTags(appId, cid);
        String tags = result.getResponse().toString();
        System.out.println(result.getResponse().toString());
        return tags;

    }

    public static List<String> getUsercids() {
        List<String> cid_list = new ArrayList<String>();
        IGtPush push = new IGtPush(url, appKey, masterSecret);
        IAliasResult queryClient = push.queryClientId(appId, Alias);
        int size = queryClient.getClientIdList().size();
        for(int i=0;i<size;i++){
            String cidd= queryClient.getClientIdList().get(i);
            cid_list.add(cidd);
        }

        return cid_list;
    }

    public static void SinglePush(String cid,String name){
        IGtPush push = new IGtPush(url, appKey, masterSecret);

        // 定义"点击链接打开通知模板"，并设置标题、内容、链接
        NotificationTemplate template = new NotificationTemplate();
        // 设置APPID与APPKEY
        template.setAppId(appId);
        template.setAppkey(appKey);
        // 设置通知栏标题与内容
        template.setTitle("血压助手向您推荐了一则健康资讯");
        template.setText(name);
        // 配置通知栏图标
        //template.setLogo("icon.png");
        // 配置通知栏网络图标
        template.setLogoUrl("http://120.27.141.50:8080/health-knowledge/upload/icon.png");
        // 设置通知是否响铃，震动，或者可清除
        template.setIsRing(false);
        template.setIsVibrate(true);
        template.setIsClearable(true);
        template.setTransmissionType(2);
        template.setTransmissionContent(name);
        APNPayload payload = new APNPayload();
        payload.setContentAvailable(1);
        payload.setSound("default");
        payload.setCategory("$由客户端定义");
        //简单模式APNPayload.SimpleMsg
        //payload.setAlertMsg(new APNPayload.SimpleAlertMsg("hello"));
        //字典模式使用下者
        payload.setAlertMsg(getDictionaryAlertMsg(name));
        template.setAPNInfo(payload);
        SingleMessage message = new SingleMessage();
        message.setOffline(true);
        // 离线有效时间，单位为毫秒，可选
        message.setOfflineExpireTime(24 * 3600 * 1000);
        message.setData(template);
        // 可选，1为wifi，0为不限制网络环境。根据手机处于的网络情况，决定是否下发
        message.setPushNetWorkType(0);
        Target target = new Target();
        target.setAppId(appId);
        target.setClientId(cid);
        //target.setAlias(Alias);
        IPushResult ret = null;
        try {
            ret = push.pushMessageToSingle(message, target);
        } catch (RequestException e) {
            e.printStackTrace();
            ret = push.pushMessageToSingle(message, target, e.getRequestId());
        }
        if (ret != null) {
            System.out.println(ret.getResponse().toString());
        } else {
            System.out.println("服务器响应异常");
        }
    }

    public static void AllPush(String name){
        IGtPush push = new IGtPush(url, appKey, masterSecret);

        // 定义"点击链接打开通知模板"，并设置标题、内容、链接
        TransmissionTemplate template = new TransmissionTemplate();
        template.setAppId(appId);
        template.setAppkey(appKey);
        template.setTransmissionContent(name);
        template.setTransmissionType(2);
        APNPayload payload = new APNPayload();
        payload.setContentAvailable(1);
        payload.setSound("default");
        payload.setCategory("$由客户端定义");
        //简单模式APNPayload.SimpleMsg
        //payload.setAlertMsg(new APNPayload.SimpleAlertMsg("hello"));
        //字典模式使用下者
        payload.setAlertMsg(getDictionaryAlertMsg(name));
        template.setAPNInfo(payload);
        List<String> appIds = new ArrayList<String>();
        appIds.add(appId);
        // 定义"AppMessage"类型消息对象，设置消息内容模板、发送的目标App列表、是否支持离线发送、以及离线消息有效期(单位毫秒)
        AppMessage message = new AppMessage();
        message.setData(template);
        message.setAppIdList(appIds);
        message.setOffline(true);
        message.setOfflineExpireTime(24 * 3600 * 1000);

        IPushResult ret = push.pushMessageToApp(message);
        System.out.println(ret.getResponse().toString());
    }

    private static APNPayload.DictionaryAlertMsg getDictionaryAlertMsg(String knoName){
        APNPayload.DictionaryAlertMsg alertMsg = new APNPayload.DictionaryAlertMsg();
        alertMsg.setBody(knoName);
        alertMsg.setActionLocKey("ActionLockey");
        alertMsg.setLocKey("LocKey");
        alertMsg.addLocArg("loc-args");
        alertMsg.setLaunchImage("launch-image");
        // IOS8.2以上版本支持
        alertMsg.setTitle("您收到了一条健康知识");
        alertMsg.setTitleLocKey("TitleLocKey");
        alertMsg.addTitleLocArg("TitleLocArg");
        return alertMsg;
    }


}