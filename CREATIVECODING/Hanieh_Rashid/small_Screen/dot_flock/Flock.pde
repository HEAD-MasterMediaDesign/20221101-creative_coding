class Flock {
  ArrayList<Dot> dots; // An ArrayList for all the boids

  Flock() {
    dots = new ArrayList<Dot>(); // Initialize the ArrayList
  }

  void run() {
    for (Dot b : dots) {
      b.run(dots);  // Passing the entire list of boids to each boid individually
    }
  }

  void addDot(Dot b) {
    dots.add(b);
  }
  

}
