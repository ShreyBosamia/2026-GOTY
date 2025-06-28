using Godot;
using System;

using System.Collections.Generic;

public partial class A_Star : Node
{
	private List<Tuple<float, float>> path; 
	
	public A_Star() {
		/* debating not doing this, as we can use nav meshes for pathfinding (given to us by godot) */
		this.path = null;
	}
	
	/* allows us to do this: List<Tuple<float, float>> path = new A_Star() */
	public static implicit operator List<Tuple<float, float>>(A_Star astar) => astar.path;
}
