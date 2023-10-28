import "../tools.css"

export default function Tools() {
    return (
      <body>
        <section className="navbar"></section>
        <section className="mainText">
        <h1>All GitHub Tools</h1>
        <p className="p1">Make use of our collection of PDF tools to process digital documents and</p>
        <p className="p2">streamline your workflow seamlessly.</p>
        </section>
      <section className="cards">
        <div className="ThreeCards">
            <div className="card11 card">
              <img src="src\assets\image 1.png" alt="" />
              <div>
                <h1>GSoC Repository Tumbler</h1>
                <p>A tool to find the best GSoC repo, with built in filter search.</p>
              </div>
            </div>
            <div className="card12 card">
            <img src="src\assets\image 2.png" alt="" />
              <div>
                <h1>Trending Repo List</h1>
                <p>A tool to find the best repos in each category, with built in diverse category filters.</p>
              </div>
            </div>
            <div className="card13 card">
            <img src="src\assets\image 3.png" alt="" />
              <div>
                <h1>Forest Farmer</h1>
                <p>A tool to maintain streaks  by making a dummy commit everyday to your Github account. </p>
              </div>
            </div>
        </div>
        <div className="TwoCards">
            <div className="card21 card">
            <img src="src\assets\image 4.png" alt="" />
              <div>
                <h1>Heatmap Snake Generator</h1>
                <p>Build the awesome snake for your readme, all using a single action file.</p>
              </div>
            </div>
            <div className="card22 card">
            <img src="src\assets\—Pngtree—notes icon vector_5509523 1.png" alt="" />
              <div>
                <h1>Top Learning Resources</h1>
                <p>Learn cool stuff from the best, while you build a profile!</p>
              </div>
            </div>
        </div>
      </section>
      <section className="form">

      </section>
      </body>

    )
  }
  