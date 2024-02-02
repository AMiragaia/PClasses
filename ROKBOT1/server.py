import discord
from discord.ext import commands
from Data.s import data_read
from Calculadora.CalculadoraMATCHING.screenshotcalculator import calculate_amount
import aiohttp

intents = discord.Intents.all()

bot = commands.AutoShardedBot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user} (ID: {bot.user.id})')
    print('------')
    for guild in bot.guilds:
        print(f'{bot.user} is connected to the following server:')
        print(f'{guild.name} (id: {guild.id})')
        print('------')

@bot.command(name='test', help='test command')
async def test(ctx, *, message):
    await ctx.send(message)

@bot.command(name='calc', help='Calculate something based on an input image')
async def calc(ctx, *, arg=None):
    # Check if the message has an attachment
    if len(ctx.message.attachments) == 0:
        await ctx.send("Please attach an image to use this command.")
        return

    # Get the first attachment from the message
    attachment = ctx.message.attachments[0]

    # Check if the attachment is an image
    if not attachment.content_type.startswith('image/'):
        await ctx.send("The attached file is not an image.")
        return
    else:
        await ctx.send("Proccess started for the image.")
       
        # Save the attachment to a local file
        local_image_path = f'./Calculadora/{attachment.filename}'
        #change the file name to the image name
        async with aiohttp.ClientSession() as session:
            async with session.get(attachment.url) as resp:
                if resp.status == 200:
                    with open(local_image_path, 'wb') as f:
                        f.write(await resp.read())
                else:
                    await ctx.send("Failed to download the attached image.")

        # show the image in the channel
        calculate_amount(local_image_path)
        await ctx.send(file=discord.File("./result.png"))
        


    

    



@bot.event
async def on_member_join(member):
    channel = member.guild.system_channel
    if channel is not None:
        await channel.send(f'Welcome {member.mention} to {member.guild.name}! Feel free to introduce yourself.')

@bot.command(name='scan', help='Run a quick kingdom scan for power.(BETA)')
async def runscript(ctx):
    result = data_read  # Call your function here
    await ctx.send("The kingdom scan has been started.")
    await ctx.send(result)
    

bot.run("MTA4NzE2MTYxNDc1Njc0OTMyMg.GNv3TV.dOLqc_je0srA7nEi88au139sTpRVfg7bYaAZCw")
