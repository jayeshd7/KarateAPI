package examples.reqresApi;

import com.intuit.karate.junit5.Karate;


class ReqresRunner {

    @Karate.Test
    Karate testGetReqresApi() {
        return Karate.run("GetApi").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPostReqresApi(){ return Karate.run("PostApi").relativeTo(getClass());}
}
