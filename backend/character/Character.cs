using Godot;
using System;

public partial class Character : Node
{
	private int points_hit;
	private int points_action;

	public Character(int points_hit) {
		this.points_hit = points_hit;
		this.points_action = 0;
	}
}
