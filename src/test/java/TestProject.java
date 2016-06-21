import java.net.URLEncoder;

import junit.framework.TestCase;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

// 测试项目查询
public class TestProject extends TestCase {
	public void testOne() throws Exception {
		sql("项目查询", "{data: {condition: '1=1'}}");
	}

	private void sql(String name, String values) throws Exception {
		String path = "http://localhost:8081/crmsql/rs/sql/"
				+ URLEncoder.encode(name).replace("+", "%20");
		// 创建POSTMethod
		HttpPost postMethod = new HttpPost(path);/* 建立HTTP Post连线 */
		StringEntity se = new StringEntity(values, "UTF-8");
		postMethod.setEntity(se);
		// 执行POSTMethod
		HttpClient httpClient = new DefaultHttpClient();
		HttpResponse response = httpClient.execute(postMethod);
		int code = response.getStatusLine().getStatusCode();
		String actual = EntityUtils.toString(response.getEntity(), "UTF8");
		System.out.println(actual);
		assertEquals(200, code);
	}
}
