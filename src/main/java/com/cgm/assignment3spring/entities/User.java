package com.cgm.assignment3spring.entities;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String username = "";
	private String password = "";
	private boolean logged = false;
	private List<User> friends;

	public User() {
		this.friends = new ArrayList<User>();
	}

	public User(String username, String password) {
		this.username = username;
		this.password = password;
		this.friends = new ArrayList<User>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isLogged() {
		return logged;
	}

	public void setLogged(boolean logged) {
		this.logged = logged;
	}

	public List<User> getFriends() {
		return friends;
	}

	public void setFriends(List<User> friends) {
		this.friends = friends;
	}

	public void addFriend(User user) {
		if (!this.friends.contains(user)) {
			this.friends.add(user);
			user.addFriend(this);
		}
	}
	
	public void removeFriend(User user) {
		if(!this.friends.isEmpty()) {
			if(this.friends.contains(user)) {
				this.friends.remove(user);
				user.removeFriend(this);
			}
		}
	}
	
	public ArrayList<String> getFriendsAsStrings() {
		ArrayList<String> friendsStrings = new ArrayList<String>();
		for(User user : friends) {
			friendsStrings.add(user.getUsername());
		}
		return friendsStrings;
	}
}
