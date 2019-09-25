<template>
  <div id="app">
    <h1>DevOps Score by Group</h1>
    <carousel v-if="carousel"
    ref="carousel"
    :per-page="2"
    :navigation-enabled="true"
    navigation-prev-label="〈"
    navigation-next-label="〉"
    :speed="1000"
    :autoplay="true"
    :loop="true"
    :autoplay-timeout="5000"
    >
    
      <slide v-for="(group,index) in groups" :key="index" >
        <div class="each-group each-group-2">
          <h2>{{ index+1}}: {{ group.name }}</h2>
          <p>DevOps Score: {{group.score}}</p>
          <RadarChart :chartdata='group.chartdata' :options='group.options' />
        </div>
      </slide>
    </carousel> 
    <div class="container" v-if="!carousel">
      <div v-for="(group,index) in groups" :key="index" class="each-group">
        <h3>{{ group.name }}</h3>
        <p>DevOps Score: {{group.score}}</p>
        <RadarChart :chartdata='group.chartdata' :options='group.options' />
      </div>
    </div>
  </div>
</template>

<script>
import RadarChart from 'components/radarChart'
import axios from 'axios';
import { Carousel, Slide } from 'vue-carousel';
export default {
  components: {
    RadarChart,
    Carousel,
    Slide
  },
  data: function () {
    return {
      carousel: false,
      // height: 
      groups: [],
      options: {
        scale: {
            ticks: {
                beginAtZero: true,
                max: 100,
                min: 0,
                stepSize: 50
            }
        },
        legend: {
              display: false
        }
      }
    }
  },
  created: function(){
    let _this = this;
    function getParam(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
    if(getParam('c')){
      this.carousel = true;
      setInterval(_this.nextSlide, 5000);
    } 
    
    axios
      .get('/dashboard/api')
      .then((res) => {
        _this.groups = res.data.data;
        console.log(_this.groups);
        var rand = function(n){return Math.floor(Math.random() * n) + 1;};
        _this.groups.forEach(e => {
          e.chartdata.datasets[0].backgroundColor = 'hsla('+rand(360)+', 80%, 80%,0.2)';
          Object.assign(e,{options: _this.options});
          console.log(e);
        });
        _this.groups.sort(function(l,r){return r.score - l.score;});
      });
  }
}
</script>

<style scoped>
h3, h2, h1, p {
  text-align: center;
}
/* p {
  font-size: 2em;
  text-align: center;
} */
.each-group {
  width: 300px;
  margin: 0px 10px;
}
.each-group-2{
  width: 600px;
}
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}

.VueCarousel-slide {
  display: flex;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
}
</style>
