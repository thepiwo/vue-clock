<template>
    <div class="clock">
        <div class="clock__hours">
            <span class="clock__hourtime">{{hourtime}}</span>
            {{hours}}
        </div>
        <div class="clock__minutes">{{minutes}}</div>
        <div v-show="statusPhrase !== ''" class="clock__statusphrase">
            {{statusPhrase}}
        </div>
    </div>
</template>

<script>
    import {getHourTime, getZeroPad, fetchStatusCode} from '../filters'

    export default {
        data() {
            return {
                hours: '',
                minutes: '',
                hourtime: '',
                statusPhrase: ''
            }
        },
        mounted() {
            setInterval(this.updateDateTime, 10000)
        },
        methods: {
            updateDateTime() {
                let now = new Date();

                this.hours = now.getHours();
                this.minutes = getZeroPad(now.getMinutes());
                this.hourtime = getHourTime(this.hours);
                this.hours = this.hours % 12 || 12;
                this.statusPhrase = fetchStatusCode(`${this.hours}${this.minutes}`).phrase
            }
        }
    }
</script>

<style>
    *,
    *:before,
    *:after {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    body {
        background-color: #dd4a38;
        margin: 0;
        color: #444;
        font-size: 16px;
        line-height: 1.5;
    }

    .container {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        width: 100vw;
    }

    .clock {
        background: #fff;
        border: .3rem solid #fff;
        border-radius: .5rem;
        display: inline-block;
        margin-bottom: 1em;
    }

    .clock__hours,
    .clock__minutes,
    .clock__statusphrase {
        background: linear-gradient(to bottom, #26303b 50%, #2c3540 50%);
        display: inline-block;
        color: #fff;
        font-family: 'Nunito', sans-serif;
        font-size: 3rem;
        font-weight: 300;
        padding: .5rem 1rem;
        text-align: center;
        position: relative;
    }

    .clock__hours {
        border-right: .15rem solid #fff;
        border-radius: .5rem 0 0 .5rem;
    }

    .clock__minutes {
        border-right: .15rem solid #fff;
        border-radius: 0 .5rem .5rem 0;
    }

    .clock__hourtime {
        font-size: 1rem;
        position: absolute;
        top: 2px;
        left: 8px;
    }

    .clock__statusphrase {
        border-right: .15rem solid #fff;
        border-radius: .5rem .5rem .5rem .5rem;
    }
</style>
