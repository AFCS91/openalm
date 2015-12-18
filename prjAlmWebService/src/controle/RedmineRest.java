package controle;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

public class RedmineRest {
	
	private static final String URL = "http://localhost:8080/redmine/";
	
	public String redmineProjects() {
		Client client = Client.create();
		WebResource webResource = client.resource(URL + "projects.json");
		String s = webResource.get(String.class);
		return s;
	}
	
	public String redmineIssues() {
		Client client = Client.create();
		WebResource webResource = client.resource(URL + "issues.json");
		String s = webResource.get(String.class);
		return s;
	}
		
}
