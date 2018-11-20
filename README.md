<div class="section" id="user-manual">
<span id="user"></span><h1>User Manual<a class="headerlink" href="#user-manual" title="Permalink to this headline"></a></h1>
<div class="section" id="overview">
<h2>Overview<a class="headerlink" href="#overview" title="Permalink to this headline"></a></h2>
<p>Cloud browser is a tool for easy visualization of large csv files. This tool allows you to upload csv files and view
them as a map i.e. perform pan and zoom operations through UI. Cloud browser processes csv files on the fly and has a
low latency for initial loading and browsing as compared to traditional tools such as Apple Numbers and Microsoft Excel.
It is available as a micro-cloud service, hence can be hosted in one place and then the users do not need to worry about
any requirements or dependencies other than a web browser.</p>
</div>
<div class="section" id="requirements">
<h2>Requirements<a class="headerlink" href="#requirements" title="Permalink to this headline"></a></h2>
<p>Cloud browser is configured to use a maximum of 30 GB of disk space. This tool has been tested for the linux
environment. In order to set up cloud browser on a host, a python 3 environment will be required which could be native,
virtual or a container. Python pip is required for installing dependencies. Wkhtmltopdf package needs to be installed on
the machine. Write permissions are required on the ‘media’ folder where temporary data will be stored.</p>
</div>
<div class="section" id="installation-on-docker">
<h2>Installation on Docker<a class="headerlink" href="#installation-on-docker" title="Permalink to this headline"></a></h2>
<p>Docker Image can be found on docker hub at kaushikc92/cloud_browser:v1</p>
<ul class="simple">
<li>First get account credentials for an ec2 Linux machine and set a security policy that will allow access to port 80 of</li>
</ul>
<p>the machine.</p>
<ul>
<li><p class="first">After ssh into the amazon box, update packages and install docker</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">yum</span> <span class="n">update</span> <span class="o">-</span><span class="n">y</span>
<span class="n">sudo</span> <span class="n">yum</span> <span class="n">install</span> <span class="o">-</span><span class="n">y</span> <span class="n">docker</span>
</pre></div>
</div>
</li>
<li><p class="first">Start Docker service</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">service</span> <span class="n">docker</span> <span class="n">start</span>
</pre></div>
</div>
</li>
<li><p class="first">Run the docker container with the image found at kaushikc92/cloud_browser:v1</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">docker</span> <span class="n">run</span> <span class="o">-</span><span class="n">p</span> <span class="mi">8000</span><span class="p">:</span><span class="mi">8000</span> <span class="n">kaushikc92</span><span class="o">/</span><span class="n">cloud_browser</span><span class="p">:</span><span class="n">v1</span>
</pre></div>
</div>
</li>
<li><p class="first">Install and start nginx</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">yum</span> <span class="n">install</span> <span class="n">nginx</span>
<span class="n">sudo</span> <span class="n">service</span> <span class="n">nginx</span> <span class="n">start</span>
</pre></div>
</div>
</li>
<li><p class="first">Edit the nginx configs</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">vi</span> <span class="o">/</span><span class="n">etc</span><span class="o">/</span><span class="n">nginx</span><span class="o">/</span><span class="n">conf</span><span class="o">.</span><span class="n">d</span><span class="o">/</span><span class="n">virtual</span><span class="o">.</span><span class="n">conf</span>
</pre></div>
</div>
</li>
<li><p class="first">Add the following line to the above file inside the http object</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">client_max_body_size</span> <span class="mi">200</span><span class="n">M</span><span class="p">;</span>
</pre></div>
</div>
</li>
<li><p class="first">Restart nginx to reflect new changes</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">service</span> <span class="n">nginx</span> <span class="n">restart</span>
</pre></div>
</div>
</li>
<li><p class="first">You could also build your own docker image from the source code and run it in the docker container.</p>
</li>
<li><p class="first">Another option is to clone the source code and host it elsewhere without using docker.</p>
</li>
</ul>
</div>
<div class="section" id="installation-from-source">
<h2>Installation from source<a class="headerlink" href="#installation-from-source" title="Permalink to this headline"></a></h2>
<ul>
<li><p class="first">Clone the repository</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">git</span> <span class="n">clone</span> <span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">github</span><span class="o">.</span><span class="n">com</span><span class="o">/</span><span class="n">anhaidgroup</span><span class="o">/</span><span class="n">tablebrowser</span><span class="o">.</span><span class="n">git</span>
</pre></div>
</div>
</li>
<li><p class="first">Install wkhtmtoimage</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">wget</span> <span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">github</span><span class="o">.</span><span class="n">com</span><span class="o">/</span><span class="n">wkhtmltopdf</span><span class="o">/</span><span class="n">wkhtmltopdf</span><span class="o">/</span><span class="n">releases</span><span class="o">/</span><span class="n">download</span><span class="o">/</span><span class="mf">0.12</span><span class="o">.</span><span class="mi">3</span><span class="o">/</span><span class="n">wkhtmltox</span><span class="o">-</span><span class="mf">0.12</span><span class="o">.</span><span class="mi">3</span><span class="n">_linux</span><span class="o">-</span><span class="n">generic</span><span class="o">-</span><span class="n">amd64</span><span class="o">.</span><span class="n">tar</span><span class="o">.</span><span class="n">xz</span>
<span class="n">tar</span> <span class="n">vxf</span> <span class="n">wkhtmltox</span><span class="o">-</span><span class="mf">0.12</span><span class="o">.</span><span class="mi">3</span><span class="n">_linux</span><span class="o">-</span><span class="n">generic</span><span class="o">-</span><span class="n">amd64</span><span class="o">.</span><span class="n">tar</span><span class="o">.</span><span class="n">xz</span>
<span class="n">cp</span> <span class="n">wkhtmltox</span><span class="o">/</span><span class="nb">bin</span><span class="o">/</span><span class="n">wk</span><span class="o">*</span> <span class="o">/</span><span class="n">usr</span><span class="o">/</span><span class="n">local</span><span class="o">/</span><span class="nb">bin</span><span class="o">/</span>
</pre></div>
</div>
</li>
<li><p class="first">Install dependencies using pip</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">cd</span> <span class="n">tablebrowser</span><span class="o">/</span><span class="n">tablebrowser</span>
<span class="n">pip</span> <span class="n">install</span> <span class="o">--</span><span class="n">trusted</span><span class="o">-</span><span class="n">host</span> <span class="n">pypi</span><span class="o">.</span><span class="n">python</span><span class="o">.</span><span class="n">org</span> <span class="o">-</span><span class="n">r</span> <span class="n">requirements</span><span class="o">.</span><span class="n">txt</span>
</pre></div>
</div>
</li>
<li><p class="first">Initialize Django database</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">python</span> <span class="n">manage</span><span class="o">.</span><span class="n">py</span> <span class="n">makemigrations</span>
<span class="n">python</span> <span class="n">manage</span><span class="o">.</span><span class="n">py</span> <span class="n">migrate</span>
</pre></div>
</div>
</li>
<li><p class="first">Start Django server</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">python</span> <span class="n">manage</span><span class="o">.</span><span class="n">py</span> <span class="n">runserver</span>
</pre></div>
</div>
</li>
</ul>
</div>
<div class="section" id="usage">
<h2>Usage<a class="headerlink" href="#usage" title="Permalink to this headline"></a></h2>
<p>This tool is pretty straight forward to use. The index page opens up a file manager portal where you can upload a csv
file, choose to browse one of the csv files already uploaded, delete a file or download a file. Clicking on the csv file
will open the file in a map window where you can use pan and zoom operations to browse it. A slider is available to the
right of the map window which can be used to quickly jump to any portion of a large csv file.</p>
</div>
<div class="section" id="rest-api">
<h2>Rest API<a class="headerlink" href="#rest-api" title="Permalink to this headline"></a></h2>
<p>Rest Api is available for uploading a csv file, requesting individual tiles, getting tile counts as well as  deleting files. If HOST_URL is
the url hosting the service, the following are the REST API available</p>
<ul class="simple">
<li>Make POST request to HOST_URL with csv file as parameter ‘docfile’ in order to upload file</li>
<li>Make GET request to HOST_URL/map/tilecount/?file=FILE_NAME to get total tile count</li>
<li>Make POST request to HOST_URL/map/delete with filename as parameter ‘file_name’ to delete the file</li>
<li>Make GET request to HOST_URL/tiler/v4/mapbox.streets/z/x/y?file=FILE_NAME to get the tile at location (x,y) and zoom level z</li>
</ul>
</div>
</div>
