
// https://vue-chartjs.org/ja/guide/#最初のチャートの作成
<template>
  <div id="app">
    <p>dashboard</p>
    <div class="container">
      <div v-for="(group,index) in groups" :key="index" class="each-group">
        <p>{{ group.name }}</p>
        <p>DevOps Score: {{group.score}}</p>
        <RadarChart :chartdata='group.chartdata' :options='group.options' />
      </div>
    </div>
  </div>
</template>

<script>
import RadarChart from 'components/radarChart'
export default {
  components: {
    RadarChart
  },
  data: function () {
    return {
      groups: [
        {
          name: 'SOK',
          score: 90,
          chartdata: {
            labels: ["シンクロ度", "コラボレーション", "アフィニティ", "ツール", "スケーリング"],
            datasets: [
              {
                label: "グループ平均",
                data: [40, 50, 60, 70, 80]
              }
            ]
          }
        }
      ],
      options: {
        scale: {
            ticks: {
                beginAtZero: true,
                max: 100,
                min: 0,
                stepSize: 50
            }
        }
      }
    }
  },
  created: function(){
    // debug data
    let _this = this;
    ["S","O","K"].forEach(e1 => {
      ["S","O","K"].forEach(e2 => {
        ["S","O","K"].forEach(e3 => {
          var tmp = JSON.parse(JSON.stringify(_this.groups[0]));
          var rand = function(n){
              return Math.floor(Math.random() * n) + 1;
          };
          _this.groups.push(tmp);
          _this.groups[_this.groups.length-1].name = e1+e2+e3;
          _this.groups[_this.groups.length-1].chartdata.datasets[0].data = [rand(100),rand(100),rand(100),rand(100),rand(100)];
          Object.assign(_this.groups[_this.groups.length-1],{options: _this.options});
        });
      });
    });
    this.groups.shift();
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.each-group {
  width: 400px;
}
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
</style>
