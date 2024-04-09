package com.lyq.blog.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

@Api(tags = "音乐接口模块")
@RestController
public class MusicController {

//    @ApiOperation(value = "获取歌词")
//    @ApiImplicitParam(name = "id", value = "歌曲id", required = true, dataType = "Integer")
//    @GetMapping("/getLyric/{id}")
//    public JSONObject getLyric(@PathVariable("id")Integer id){
//        String url = "https://n.xlz122.cn/api/lyric";
//        //        请求表
//        JSONObject paramMap = new JSONObject();
//        paramMap.put("id", id);
//        //        请求头
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36");
//        //        整合请求头和请求参数
//        HttpEntity<JSONObject> httpEntity = new HttpEntity<>(paramMap, headers);
//        //         请求客户端
//        RestTemplate client = new RestTemplate();
//        //      发起请求
//        JSONObject body = client.postForEntity(url, httpEntity, JSONObject.class).getBody();
//        System.out.println("******** 获取歌词 GET请求 *********");
//        assert body != null;
//        return body;
//    }
//    @ApiOperation(value = "获取歌曲详情")
//    @ApiImplicitParam(name = "id", value = "歌曲id", required = true, dataType = "Integer")
//    @GetMapping("/getMusicInfo/{id}")
//    public JSONObject getMusicInfo(@PathVariable("id")Integer id){
//        String url = "https://n.xlz122.cn/api/song/detail";
//        //        请求表
//        JSONObject paramMap = new JSONObject();
//        paramMap.put("id", id);
//        //        请求头
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36");
//        //        整合请求头和请求参数
//        HttpEntity<JSONObject> httpEntity = new HttpEntity<>(paramMap, headers);
//        //         请求客户端
//        RestTemplate client = new RestTemplate();
//        //      发起请求
//        JSONObject body = client.postForEntity(url, httpEntity, JSONObject.class).getBody();
//        System.out.println("******** 获取歌曲详情 GET请求 *********");
//        assert body != null;
//        return body;
//    }
//
//    @ApiOperation(value = "获取歌曲url")
//    @ApiImplicitParam(name = "id", value = "歌曲id", required = true, dataType = "Integer")
//    @GetMapping("/getMusicUrl/{id}")
//    public JSONObject getMusicUrl(@PathVariable("id")Integer id){
//        String url = "https://n.xlz122.cn/api/song/url";
//        //        请求表
//        JSONObject paramMap = new JSONObject();
//        paramMap.put("id", id);
//        //        请求头
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36");
//        //        整合请求头和请求参数
//        HttpEntity<JSONObject> httpEntity = new HttpEntity<>(paramMap, headers);
//        //         请求客户端
//        RestTemplate client = new RestTemplate();
//        //      发起请求
//        JSONObject body = client.postForEntity(url, httpEntity, JSONObject.class).getBody();
//        System.out.println("******** 获取歌曲url GET请求 *********");
//        assert body != null;
//        return body;
//    }
//
//
//
//    @ApiOperation(value = "获取热门歌曲列表")
//    @ApiImplicitParam(name = "id", value = "歌曲分类id", required = true, dataType = "Integer")
//    @GetMapping("/music/getHotMusic/{id}")
//    public JSONObject getHotMusic(@PathVariable("id")Integer id){
//        String url = "https://n.xlz122.cn/api/playlist/detail";
//        //        请求表
//        JSONObject paramMap = new JSONObject();
//        paramMap.put("id", id);
//        //        请求头
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36");
//        //        整合请求头和请求参数
//        HttpEntity<JSONObject> httpEntity = new HttpEntity<>(paramMap, headers);
//        //         请求客户端
//        RestTemplate client = new RestTemplate();
//        //      发起请求
//        JSONObject body = client.postForEntity(url, httpEntity, JSONObject.class).getBody();
//        System.out.println("******** 获取热门歌曲列表 GET请求 *********"+id);
//        assert body != null;
//        return body;
//    }
//
//
//
//
//    @ApiOperation(value = "获取歌曲评论")
//    @ApiImplicitParam(name = "id", value = "歌曲id", required = true, dataType = "Integer")
//    @GetMapping("/getHotTalk/{id}")
//    public JSONObject getHotTalk(@PathVariable("id")Integer id){
//        String url = "https://n.xlz122.cn/api/comment/music";
//        //        请求表
//        JSONObject paramMap = new JSONObject();
//        paramMap.put("id", id);
//        paramMap.put("limit",3);
//        //        请求头
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        headers.set("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36");
//        //        整合请求头和请求参数
//        HttpEntity<JSONObject> httpEntity = new HttpEntity<>(paramMap, headers);
//        //         请求客户端
//        RestTemplate client = new RestTemplate();
//        //      发起请求
//        JSONObject body = client.postForEntity(url, httpEntity, JSONObject.class).getBody();
//        System.out.println("******** 获取歌曲评论 GET请求 *********");
//        assert body != null;
//        return body;
//    }
}
