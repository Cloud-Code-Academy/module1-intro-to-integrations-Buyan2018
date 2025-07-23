public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    private static final String GET_METHOD = 'GET';
    private static final String POST_METHOD = 'POST';
    private static final String PUT_METHOD = 'PUT';
    private static final String PATCH_METHOD = 'PATCH';
    private static final String DELETE_METHOD = 'DELETE';
    private static final String URL_END = '/posts/';
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'GET'
        // 4. Send the request and get the response
        // 5. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/post/' + postId);
        req.setMethod(GET_METHOD);
        Http http = new Http();
        HttpResponse res = http.send(req);
        String resBody = res.getBody();
        return resBody;

    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts'
        // 3. Set the HTTP method to 'POST'
        // 4. Create a JSON string with the post data
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts');
        req.setMethod(POST_METHOD);
        String reqBody = JSON.serialize(body);
        req.setBody(reqBody);
        req.setHeader('title', title);
        String userIdString = String.valueOf(userId);
        req.setHeader('userId', userIdString);
        Http http = new Http();
        HttpResponse res = http.send(req);
        String resBody = res.getBody();
        return resBody;

    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'PUT'
        // 4. Create a JSON string with the updated post data
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + URL_END + '{' + postId +'}');
        req.setMethod(PUT_METHOD);
        String reqBody = JSON.serialize(body);
        String userIdString = String.valueOf(userId);
        req.setBody(reqBody);
        req.setHeader('userId', userIdString);
        Http http = new Http();
        HttpResponse res = http.send(req);
        String resBody = res.getBody();
        return resBody;
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'PATCH'
        // 4. Create a JSON string with only the title
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        HttpRequest req = new HttpRequest();
        String postIdString = String.valueOf(postId);
        req.setEndpoint(BASE_URL + URL_END + postIdString);
        String reqBody = JSON.serialize(title);
        req.setBody(reqBody);
        req.setMethod(PATCH_METHOD);
        Http http = new Http();
        HttpResponse res = http.send(req);
        String resBody = res.getBody();
        return resBody;
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'DELETE'
        // 4. Send the request and get the response
        // 5. Return the response status code
        HttpRequest req = new HttpRequest();
        String postIdString = String.valueOf(postId);
        req.setEndpoint(BASE_URL + URL_END + postIdString);
        req.setMethod(DELETE_METHOD);
        Http http = new Http();
        HttpResponse res = http.send(req);
        Integer resStatusCode = res.getStatusCode();
        return resStatusCode;
    }
} 